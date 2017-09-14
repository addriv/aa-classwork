class UserController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save!
      # do happy shit
    else
      # sad shit
    end
  end

  private
  def new_user_params
    params.require(:user).permit(:username, :password)
  end
end
