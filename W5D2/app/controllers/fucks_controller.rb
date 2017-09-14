class FucksController < ApplicationController
  def index
  end

  def show
    @fuck = Fuck.find_by_id(params[:id])
  end

  def new
    @fuck = Fuck.new
    render :new
  end

  def create
    @fuck = Fuck.new(fuck_params)
    @fuck.author_id = current_user.id

    if @fuck.save
      redirect_to fuck_url(@fuck)
    else
      flash_errors(@fuck)
      render :new
    end
  end

  def edit
    @fuck = Fuck.find_by_id(params[:id])
    render :edit
  end

  def update
    @fuck = Fuck.find_by_id(params[:id])

    if @fuck.update_attributes(fuck_params)
      redirect_to fuck_url(@fuck)
    else
      flash_errors(@fuck)
      render :edit
    end
  end

  def destroy
  end

  def fuck_params
    params.require(:fuck).permit(:name, :img_url, :content, fuck_list_ids: [])
  end
end
