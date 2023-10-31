class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [ :show, :edit,  :update, :destroy ]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @new_user = User.new(user_params)
    @new_user.created_at = Time.now
    @new_user.updated_at = Time.now
    @new_user.isadmin = false

    if @new_user.save
      render json: @new_user, status: :created
    else
      render json: @new_user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user.created_at = Time.now
    @user.updated_at = Time.now

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def connect
    @connect_user = User.new(connect_params)
    @user_db = User.find_by(pseudo: @connect_user.pseudo)

    if @connect_user.password == @user_db.password
      render json: @user_db, status: :ok
    else
      render json: nil, status: :not_found
    end

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:pseudo, :password, :email)
  end

  def connect_params
    params.require(:user).permit(:pseudo, :password)
  end
end