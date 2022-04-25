class Api::V1::CharactersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_character, only: [ :show, :edit,  :update, :destroy ]
  def index
    @characters = Character.all
    render json: @characters
  end

  def show
    render json: @character
  end

  def create
    @character = Character.new(character_params)

    #@character.game_id = 2
    if @character.save
      render json: @character, status: :created
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  def update
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @character.destroy
  end


  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:firstname,:lastname, :age, :job, :background, :player, :gender, :race, :origin, :game_id)
  end
end
