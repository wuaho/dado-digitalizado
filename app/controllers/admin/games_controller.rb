module Admin
  class GamesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_game, only: %i[show edit update destroy]

    def index
      @games = Game.all
    end

    def show; end

    def new
      @game = Game.new
    end

    def edit; end

    def create
      @game = Game.new(game_params)

      respond_to do |format|
        if @game.save
          format.html { redirect_to admin_game_url(@game), notice: 'Game was successfully created.' }
          format.json { render :show, status: :created, location: @game }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @game.update(game_params)
          format.html { redirect_to admin_game_url(@game), notice: 'Game was successfully updated.' }
          format.json { render :show, status: :ok, location: @game }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @game.destroy

      respond_to do |format|
        format.html { redirect_to admin_games_url, notice: 'Game was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :description, :min_players,
                                   :max_players, :language, :min_age, :brand, :stock, tag_ids: [])
    end

    def require_admin
      unless current_user.admin?
        flash[:alert] = 'Forbidden'
        redirect_to root_path # halts request cycle
      end
    end
  end
end
