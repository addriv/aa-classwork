import React from 'react';
import { Link } from 'react-router-dom';
import ItemDetailContainer from '../items/item_detail_container';
import { Route } from 'react-router-dom';

export default class PokemonDetail extends React.Component {

  componentDidMount() {
    if (!this.props.pokemon || !this.props.pokemon.poke_type) {
      this.props.fetchPokemon(this.props.match.params.pokemonId);
    }
  }

  componentWillReceiveProps(newProps){
    if (newProps.match.params.pokemonId !== this.props.match.params.pokemonId){
      this.props.fetchPokemon(newProps.match.params.pokemonId);
    }
  }

  render(){
    const poke = this.props.pokemon;
    if(!poke) return null;

    const items = poke.item_ids.map(itemId => {
      const item = this.props.items[itemId];
      return (
        <li key={itemId}>
          <Link to={`/pokemon/${poke.id}/item/${itemId}`}>
              <img src={item.image_url}/>
          </Link>
        </li>
      );
    });

    let display;

    if (this.props.loading) {
      display = (
        <div id="loading-pokeball-container">
          <div id="loading-pokeball"></div>
        </div>
      );
    } else {
      display = (
        <div>
          <img src={poke.image_url} />
          <li className='poke-detail-li'>Poke #: {poke.id}</li>
          <li className='poke-detail-li'>Name: {poke.name}</li>
          <li className='poke-detail-li'>Attack: {poke.attack}</li>
          <li className='poke-detail-li'>Defense: {poke.defense}</li>
          <li className='poke-detail-li'>Type: {poke.poke_type}</li>

          <ul className='items-ul'>
            {items}
          </ul>
          <Route
            path='/pokemon/:pokemonId/item/:itemId'
            component={ItemDetailContainer}/>
        </div>
      );
    }

    return (
      <div className='poke-detail'>
        {display}
      </div>
   );
  }

}
