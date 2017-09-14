import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import Root from './components/root';
import { Route, HashRouter } from 'react-router-dom';

// test
import {fetchAllPokemons, receiveAllPokemon, fetchPokemon} from './actions/pokemon_actions';
window.fetchAllPokemons = fetchAllPokemons;
window.fetchPokemon = fetchPokemon;
window.receiveAllPokemon = receiveAllPokemon;
import { selectAllPokemon, selectPokemonById} from './reducers/selectors';
window.selectAllPokemon = selectAllPokemon;
window.selectPokemonById = selectPokemonById;

document.addEventListener('DOMContentLoaded', ()=> {
  const store = configureStore();
  window.store = store;

  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});
