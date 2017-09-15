import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { selectPokemonById, selectCachedItems } from '../../reducers/selectors';
import {fetchPokemon, requestSinglePokemon} from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: selectPokemonById(state),
  items: selectCachedItems(state),
  loading: state.loading
});

const mapDispatchToProps = dispatch => ({
  fetchPokemon: (pokemon) => dispatch(fetchPokemon(pokemon)),
  requestSinglePokemon: () => dispatch(requestSinglePokemon())
});


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
