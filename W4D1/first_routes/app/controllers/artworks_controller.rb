class ArtworksController < ApplicationController
  def index
    # @artworks = Artwork.all
    # render json: @artworks
    @artworks = Artwork.artwork_for_user_id(params[:user_id])
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artworks_params)
    if @artwork.save!
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork.destroy
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def updated_at
    @artwork = Artwork.find(params[:id])
    if @artwork.update
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  private

  def artworks_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
