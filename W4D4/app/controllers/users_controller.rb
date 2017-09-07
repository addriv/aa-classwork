class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(new_user_params)

    @user.abuse!(params[:user][:cat_kill_id])

    @user.password=(@user.password)

    if @user.save
      redirect_to user_url(@user)
    else
      flash[:killed_cat] = @user.killed_cat
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user.username
  end

  private
  def new_user_params
    params.require(:user).permit(:username, :password)
  end
end
