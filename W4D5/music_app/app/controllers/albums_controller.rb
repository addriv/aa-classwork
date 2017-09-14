class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def show
    @album = current_album
    if @album
      render :show
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def edit
    @album = current_album
    render :edit
  end

  def update
    @album = current_album
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def destroy
    @album = current_album
    @album.destroy
    redirect_to band_url(@album.band_id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end

  def current_album
    Album.find_by_id(params[:id])
  end
end
