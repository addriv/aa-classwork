class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to fuck_lists_url
    else
      flash_errors(@user)
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
