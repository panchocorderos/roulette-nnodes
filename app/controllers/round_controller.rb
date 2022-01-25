class RoundController < ApplicationController
  def index
    @players = Player.all
    @bets = Bet.all
  end
end