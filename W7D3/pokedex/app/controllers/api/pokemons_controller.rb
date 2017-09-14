class Api::PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.find_by_id(params[:id])
    render :show
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :attack, :defense, :image_url, :moves, :poke_type)
  end
end
