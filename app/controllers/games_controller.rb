class GamesController < ApplicationController
  before_action :set_game, only: %i[show]
  before_action :set_user, only: %i[show]
  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
