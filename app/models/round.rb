require 'net/http'
require 'uri'
require 'json'


class Round < ApplicationRecord
    enum :result_color, [ :green, :red, :black]
    has_many :bets
    has_many :players, through: :bets
    
    def self.roulette_result
        random_percentaje = rand(1..100)
        return "green" if random_percentaje <= 2

        random_percentaje > 2 and random_percentaje <= 51 ? "red" : "black"
    end

    def self.get_result(player_bet, amount, color_result)
        return 0 if player_bet != color_result

        player_bet == "green" ? result = amount * 15 : result = amount * 2
        return result
    end

    def self.get_max_temperature(response_weather)
        daily_weather = response_weather["daily"]
        max_temp = 0
        daily_weather.each do |day|
            max_temp = (day["temp"]["max"]).to_i if (day["temp"]["max"]).to_i > max_temp
        end
        max_temp
    end
    
    def self.start_game
        uri = URI("https://api.openweathermap.org/data/2.5/onecall?lat=-33.41&lon=-70.60&exclude=minutely,hourly,alerts&units=metric&appid=#{ENV["API_KEY"]}")
        res = Net::HTTP.get_response(uri)
        obj_res = JSON.parse(res.body)
        if res.is_a?(Net::HTTPSuccess)
            temperature = get_max_temperature(obj_res)
        else
            raise Exception.new(obj_res)
        end
        players = Player.all
        game_result = roulette_result()
        round = Round.create result_color: game_result, weather: temperature
        players.each do |player|
            bet_amount = player.make_bet(temperature)
            player.cash -= bet_amount
            player_color = roulette_result()
            amount_earned = get_result(player_color, bet_amount, game_result)
            player.cash += amount_earned
            player.save
            bet = Bet.create amount: bet_amount, player_id: player.id, color: player_color, round_id: round.id
        end

    end

    def self.end_day
        players = Player.all
        players.each do |player|
            player.cash += 10000
            player.save
        end
    end
end
