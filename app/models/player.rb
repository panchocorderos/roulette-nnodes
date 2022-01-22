class Player < ApplicationRecord
    has_many :bets
    has_many :rounds, through: :bets

    def make_bet(max_temperature)
        return self.cash if self.cash <= 1000

        max_temperature < 29 ?
            percentage = rand(0.08..0.15)
            :
            percentage = rand(0.03..0.07)

        return (self.cash * percentage).to_i
    end
end
