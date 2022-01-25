require 'net/http'
require 'uri'
require 'json'

class OpenWeather

    def get_max_temperature_for_7_days_forecast()
        uri = URI("https://api.openweathermap.org/data/2.5/onecall?lat=-33.41&lon=-70.60&exclude=minutely,hourly,alerts&units=metric&appid=#{ENV["API_KEY"]}")
        res = Net::HTTP.get_response(uri)
        obj_res = JSON.parse(res.body)
        if res.is_a?(Net::HTTPSuccess)
            daily_weather = obj_res["daily"]
            max_temp = 0
            daily_weather.each do |day|
                max_temp = (day["temp"]["max"]).to_i if (day["temp"]["max"]).to_i > max_temp
            end
        else
            raise Exception.new(obj_res)
        end
        max_temp
    end
end