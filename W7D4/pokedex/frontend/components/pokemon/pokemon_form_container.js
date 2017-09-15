import { connect } from 'react-redux';
import PokemonForm from './pokemon_form';
import { createPokemon, clearErrors } from '../../actions/pokemon_actions';
import { withRouter } from 'react-router-dom';
import { selectAllErrors } from '../../reducers/selectors';

const mapStateToProps = state => ({
  errors: selectAllErrors(state)
});

const mapDispatchToProps = dispatch => ({
  createPokemon: (pokeData) => dispatch(createPokemon(pokeData)),
  clearErrors: () => dispatch(clearErrors())
});

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(PokemonForm)
);
