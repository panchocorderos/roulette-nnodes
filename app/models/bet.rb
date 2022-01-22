class Bet < ApplicationRecord
    enum :color, [ :green, :red, :black]
    belongs_to :player
    belongs_to :round
end
