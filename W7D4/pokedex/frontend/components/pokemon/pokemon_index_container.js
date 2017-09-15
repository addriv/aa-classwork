import { connect } from 'react-redux';
import { fetchAllPokemons, fetchPokemon } from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';
import { selectAllPokemon } from '../../reducers/selectors';


const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
  items: state.entities.items,
  loading: state.loading
});

const mapDispatchToProps = dispatch => ({
  fetchAllPokemons: () => dispatch(fetchAllPokemons()),
  fetchPokemon: (pokemonId) => dispatch(fetchPokemon(pokemonId))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);
