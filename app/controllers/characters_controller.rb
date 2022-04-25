class CharactersController < ApplicationController
  before_action :set_character, only: [ :show, :edit,  :update, :destroy ]
  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(params.require(:character).permit(:firstname,:lastname, :age, :job, :background, :player, :gender, :race, :origin, :game_id))

    @character.game_id = 2
    # render plain: @character.inspect
    if @character.save
      redirect_to character_path(@character)
      # shortcut for path: @character
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    if @character.update(character_params)
      redirect_to @character
    else
      render 'edit'
    end
  end

  def destroy
    @character.destroy

    redirect_to characters_path
  end


  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:firstname,:lastname, :age, :job, :background, :player, :gender, :race, :origin)
  end
end
