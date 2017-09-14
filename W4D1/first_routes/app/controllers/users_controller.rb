class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
  end

  def create
    @user = User.new(users_params)
    if @user.save!
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  def updated_at
    @user = User.find(params[:id])
    if @user.update
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  private

  def users_params
    params.require(:user).permit(:username)
  end
end
