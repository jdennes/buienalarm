require "uri"
require "faraday"
require "faraday_middleware"
require "json"
require "date"

module Buienalarm
  module Scraper

    # Scrape http://www.buienalarm.nl/location/<location> for the projected
    # rainfall in the next two hours.
    #
    # location - A String representing the location to query. e.g. "rotterdam"
    #
    # Returns a Hash containing the following:
    #   :location - A String representing the actual location found for the
    #               location provided as input.
    #   :rainfall - An Array of Hashes. Each hash represents the projected
    #               rainfall at a point in time, five minutes apart over the
    #               next two hours. Each hash contains the following:
    #                 :time     - A DateTime representing the point in time.
    #                 :rainfall - A Float representing the rainfall in mm
    #                             per hour.
    #                 :level    - The defined level ("none", "light",
    #                             "moderate", or "heavy").
    def self.scrape(location)
      # Details of how to scrape and use the data are documented in:
      # https://gist.github.com/jdennes/61322ea392df9120396eb6651f64e566
      conn = Faraday.new(:url => "http://www.buienalarm.nl") do |faraday|
        faraday.use     FaradayMiddleware::FollowRedirects, limit: 3
        faraday.adapter Faraday.default_adapter
      end
      response = conn.get "/location/#{URI.escape(location)}"
      page = response.body

      /^.*locationdata\['forecast'\] = (?<json>\{.*\});/i =~ page
      raise "No projected rainfall data found for '#{location}'" unless json

      /^.*locationdata\['locality'\] = '(?<locality>.*)';/i =~ page
      raise "No location found for '#{location}'" unless locality

      data = JSON.parse(json)
      start = Time.at(data["start"]).to_datetime
      rainfall = []
      data["precip"].each do |level|
        rf = 10 ** ((level - 109.0) / 32.0)
        rainfall << {
          :time     => start,
          :rainfall => rf,
          :level    => self.calculate_level(rf, data["levels"])
        }
        start += Rational(5, (60 * 24)) # Increment start by five minutes
      end

      {
        :location => locality,
        :rainfall => rainfall
      }
    end

    # Calculate the "level" of rainfall in human terms, given the levels
    # defined by Buienalarm.nl.
    #
    # rainfall - A Float representing rainfall in mm per hour.
    # levels   - A Hash containing entries for the rainfall levels returned by
    #            Buienalarm.nl. Contains the following keys: "light",
    #            "moderate", and "heavy".
    #
    # Returns a String representing the level defined by Buienalarm.nl for the
    # rainfall value.
    def self.calculate_level(rainfall, levels)
      light = levels["light"]
      moderate = levels["moderate"]
      heavy = levels["heavy"]

      case
      when rainfall.round(2) == 0.00
        "none"
      when rainfall <= light
        "light"
      when rainfall <= moderate
        "moderate"
      when rainfall > moderate
        "heavy"
      else
        "unknown"
      end
    end

  end
end
