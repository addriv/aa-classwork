class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def show
    @band = current_band
    if @band
      render :show
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def edit
    @band = current_band
    render :edit
  end

  def update
    @band = current_band
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def destroy
    @band = current_band
    @band.destroy
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

  def current_band
    Band.find_by_id(params[:id])
  end
end
