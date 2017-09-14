import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import {HashRouter, Route} from 'react-router-dom';

export default class PokemonIndex extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.fetchAllPokemons();
  }

  render(){
    const pokemons = this.props.pokemon.map(poke=> {
      return <PokemonIndexItem
                key={poke.id}
                poke={poke}
                fetchPokemon={this.props.fetchPokemon}/>;
    });

    return (
      <section className='pokedex'>
        <ul>
          {pokemons}
        </ul>
        <Route
          path='/pokemon/:pokemonId'
          component={PokemonDetailContainer}
          />
      </section>
    );
  }
}
