require "net/http"
require "json"
require "date"

module Buienalarm
  module Scraper

    # Scrape http://www.buienalarm.nl/location/<location> for the projected
    # rainfall in the next two hours.
    #
    # location - The location to query. Example: "rotterdam"
    #
    # Returns an Array of Hash. Each hash represents the projected rainfall at a
    # point in time, five minutes apart over the next two hours. Each hash
    # contains the following:
    #   :time - A DateTime representing the point in time
    #   :precip - A Float representing the rainfall in mm per hour
    #   :level - The defined level ("none", "light", "moderate", or "heavy")
    def self.scrape(location="")
      # Details of how to scrape and use the data are documented in:
      # https://gist.github.com/jdennes/61322ea392df9120396eb6651f64e566

      page = Net::HTTP.get "www.buienalarm.nl", "/location/#{location}"
      /^.*locationdata\['forecast'\] = (?<json>\{.*\});/i =~ page
      raise "No projected rainfall data for '#{location}' found" unless json

      data = JSON.parse(json)
      start = Time.at(data["start"]).to_datetime
      result = []
      data["precip"].each do |level|
        precip = (10 ** ((level - 109) / 32)).to_f
        result << {
          :time => start,
          :precip => precip,
          :level => self.calculate_level(precip, data)
        }
        start += Rational(5, (60 * 24)) # Increment start by five minutes
      end
      result
    end

    def self.calculate_level(precip, data)
      light = data["levels"]["light"]
      moderate = data["levels"]["moderate"]
      heavy = data["levels"]["heavy"]

      case
      when precip.round(2) == 0.00
        "none"
      when precip <= light
        "light"
      when precip <= moderate
        "moderate"
      when precip > moderate
        "heavy"
      else
        "unknown"
      end
    end

  end
end
