import React from 'react';
import { Link } from 'react-router-dom';

export default class PokemonIndexItem extends React.Component {
  constructor(props){
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e){
    e.preventDefault();
    debugger;
    this.props.fetchPokemon(this.props.poke.id);
  }

  render(){
    const poke = this.props.poke;

    return (

     <li onClick={this.handleClick}>
       <Link to={`/pokemon/${poke.id}`}>
         {poke.id}
         <img src={poke.image_url} />
         {poke.name}
       </Link>
     </li>
   );
  }
}
