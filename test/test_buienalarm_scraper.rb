require "minitest/autorun"
require_relative "../lib/buienalarm_scraper"

class TestBuienalarmScraper < Minitest::Test

  def test_that_scrape_raises_an_error_when_no_data_is_found
    location = "not-a-valid-location"
    error = assert_raises RuntimeError do
      Buienalarm::Scraper.scrape(location)
    end
    assert_equal "No projected rainfall data for '#{location}' found",
      error.message
  end

  def test_that_scrape_returns_valid_result
    location = "rotterdam"
    result = Buienalarm::Scraper.scrape(location)
    assert result.is_a? Array

    # TODO: Add more assertions

  end

end
