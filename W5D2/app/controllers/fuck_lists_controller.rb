class FuckListsController < ApplicationController
  before_action :require_moderator_status, only: [:edit, :update]

  def index
    @fuck_lists = FuckList.all
    render :index
  end

  def show
    @fuck_list = FuckList.find_by_id(params[:id])
    if @fuck_list
      render :show
    else
      flash_errors(@fuck_list)
      redirect_to fuck_lists_url
    end
  end

  def new
    @fuck_list = FuckList.new
    render :new
  end

  def create
    @fuck_list = FuckList.new(fuck_list_params)
    @fuck_list.moderator_id = current_user.id
    if @fuck_list.save
      redirect_to fuck_list_url(@fuck_list)
    else
      flash_errors(@fuck_list)
      render :new
    end
  end

  def edit
    @fuck_list = FuckList.find_by_id(params[:id])
    render :edit
  end

  def update
    @fuck_list = FuckList.find_by_id(params[:id])
    if @fuck_list.update(fuck_list_params)
      redirect_to fuck_list_url(@fuck_list)
    else
      flash_errors(@fuck_list)
      render :edit
    end
  end

  def destroy
  end

  private
  def fuck_list_params
    params.require(:fuck_list).permit(:name, :description)
  end

  def require_moderator_status
    fuck_list = FuckList.find_by_id(params[:id])
    redirect_to fuck_list_url(fuck_list) unless fuck_list.moderator == current_user
  end
end
