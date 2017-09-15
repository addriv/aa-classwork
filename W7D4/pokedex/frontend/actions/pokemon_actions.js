import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';
export const RECEIEVE_POKEMON_ERRORS = 'RECEIEVE_POKEMON_ERRORS';
export const CLEAR_POKEMON_ERRORS = 'CLEAR_POKEMON_ERRORS';
export const START_LOADING_ALL_POKEMON = 'START_LOADING_ALL_POKEMON';
export const START_LOADING_SINGLE_POKEMON = 'START_LOADING_SINGLE_POKEMON';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receivePokemon = payload => ({
  type: RECEIVE_POKEMON,
  payload
});

export const receiveErrors = errors => {
  return {
    type: RECEIEVE_POKEMON_ERRORS,
    errors: errors.responseJSON
  };
};

export const clearErrors = () => ({
  type: CLEAR_POKEMON_ERRORS
});

export const requestAllPokemon = () => ({
  type: START_LOADING_ALL_POKEMON
});

export const requestSinglePokemon = () => ({
  type: START_LOADING_SINGLE_POKEMON
});

export const fetchAllPokemons = () => dispatch => {
  dispatch(requestAllPokemon());
  APIUtil.fetchAllPokemons()
         .then((res) => dispatch(receiveAllPokemon(res)));
};

export const fetchPokemon = (pokemonId) => dispatch => {
  dispatch(requestAllPokemon());
  APIUtil.fetchPokemon(pokemonId)
         .then((res) => dispatch(receivePokemon(res)));
};

export const createPokemon = data => dispatch => {
  const success = pokemon => {
    dispatch(receivePokemon(pokemon));
    return pokemon;
  };

  const error = errors => {
    dispatch(receiveErrors(errors));
  };

  return APIUtil.createPokemon(data).then(success, error);

};
