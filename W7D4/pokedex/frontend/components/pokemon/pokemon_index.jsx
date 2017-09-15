import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonFormContainer from './pokemon_form_container';
import { Route } from 'react-router-dom';

export default class PokemonIndex extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.fetchAllPokemons();
  }

  render(){
    console.log(this.props.loading);
    const pokemons = this.props.pokemon.map(poke=> {
      return <PokemonIndexItem
                key={poke.id}
                poke={poke}
                fetchPokemon={this.props.fetchPokemon}/>;
    });
    let display;
    if (this.props.loading) {
        console.log("entered pokeball loader");
       display = (
        <div id="loading-pokeball-container">
          <div id="loading-pokeball"></div>
        </div>
      );
    } else {
      console.log("display default");
      display = (
          <section className='pokedex'>
            <ul className='poke-index'>
              {pokemons}
            </ul>
            <Route
              path='/pokemon/:pokemonId'
              component={PokemonDetailContainer}
              />
            <Route
              exact path='/'
              component={PokemonFormContainer}
              />
          </section>
      );
    }
    return (
      <div>
        {display}
      </div>
    );
  }
}
