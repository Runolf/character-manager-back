class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_game, only: %i[show update delete]

  # GET request
  def index
     @games = Game.all

     render json: @games
  end

  def show
    render json: @game
  end

  # POST
  def create
    @game = Game.new(game_params)

    # , location: api_v1_games_path(@game) was in the success if but didn't work
    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PUT
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @game.destroy
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :genre, :image, :owner)
  end
end
