import React from 'react';

export default class PokemonForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      name: '',
      image_url: '',
      poke_type: '',
      attack: '',
      defense: '',
      move1: '',
      move2: ''
    };
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(event){
    event.preventDefault();
    const {name, image_url, poke_type, attack, defense, move1, move2} = this.state;
    const pokeData = {
      pokemon: {
        name,
        image_url,
        poke_type,
        attack: parseInt(attack),
        defense: parseInt(defense),
        moves: [move1, move2]
      }
    };
    this.props.createPokemon(pokeData).then(newPokemon => {
      this.props.history.push(`pokemon/${newPokemon.pokemon.id}`);
    }).then(this.props.clearErrors());
  }

  componentWillUnmount() {
    this.props.clearErrors();
  }

  handleInput(type){
    return (event) => {this.setState({ [type]: event.target.value });};
  }

  render(){
    const errors = this.props.errors.map((error,i) => {
      return <li key={i}>{error}</li>;
    });

    return (
      <div>
        <h1>Pokemon Form</h1>
        <ul>
          { errors }
        </ul>
        <form className='poke-form'>
          <input onChange={this.handleInput('name')} type='text' placeholder='Name' value={this.state.name}></input>
          <input onChange={this.handleInput('image_url')} type='text' placeholder='Image Url' value={this.state.image_url}></input>
          <input onChange={this.handleInput('poke_type')} type='text' placeholder='Type' value={this.state.poke_type}></input>
          <input onChange={this.handleInput('attack')} type='text' placeholder='Attack' value={this.state.attack}></input>
          <input onChange={this.handleInput('defense')} type='text' placeholder='Defense' value={this.state.defense}></input>
          <input onChange={this.handleInput('move1')} type='text' placeholder='Move 1' value={this.state.move1}></input>
          <input onChange={this.handleInput('move2')} type='text' placeholder='Move 2' value={this.state.move2}></input>
          <button onClick={this.handleSubmit}>Create Pokemon!</button>
        </form>
      </div>
    );
  }
}
