require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    @url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================

    @url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @url_safe_street_address
    
    @parsed_data = JSON.parse(open(@url).read)
    @lat = @parsed_data.dig("results", 0, "geometry", "location", "lat")
    @lng = @parsed_data.dig("results", 0, "geometry", "location", "lng")


    @url = "https://api.darksky.net/forecast/d7ec05fb203bcf75c541f7d8b630f94b/" + @lat.to_s + "," + @lng.to_s

    @parsed_data = JSON.parse(open(@url).read)

    @current_temperature = @parsed_data.dig("currently", "temperature")

    @current_summary = @parsed_data.dig("currently", "summary")

    @summary_of_next_sixty_minutes = @parsed_data.dig("minutely", "summary")

    @summary_of_next_several_hours = @parsed_data.dig("hourly", "summary")

    @summary_of_next_several_days = @parsed_data.dig("daily", "summary")

    render("meteorologist/street_to_weather.html.erb")
  end
end
