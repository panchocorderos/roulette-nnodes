class Bet < ApplicationRecord
    enum :result [ :green, :red, :black]
    has_many :players
    has_many :rounds
end
