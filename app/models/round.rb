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
    
    def self.start_game
        players = Player.all
        game_result = roulette_result()
        players.each do |player|
            bet_amount = player.make_bet(20)
            player.cash -= bet_amount
            player_color = roulette_result()
            amount_earned = get_result(player_color, bet_amount, game_result)
            player.cash += amount_earned
            player.save
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
