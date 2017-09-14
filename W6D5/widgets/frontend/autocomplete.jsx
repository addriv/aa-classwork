import React from 'react';

export default class AutoComplete extends React.Component {
  constructor(props){
    super(props);
    this.state = { inputVal: '' };
    this.handleInput = this.handleInput.bind(this);
    this.searchResults = this.searchResults.bind(this);
    this.enterName = this.enterName.bind(this);
  }

  enterName(event) {
    let name = event.currentTarget.innerText;
    this.setState({ inputVal: name });
  }

  handleInput(e){
    this.setState({inputVal: e.currentTarget.value});
  }

  searchResults(){
    const results = [];
    if (this.state.inputVal.length === 0) {
      return this.props.names;
    }

    this.props.names.forEach(name => {
      let input = this.state.inputVal;
      let nameToLength = name.slice(0, input.length);
      if (nameToLength.toLowerCase() === input.toLowerCase()){
        results.push(name);
      }
    });

    if (results.length === 0) {
      results.push('No matches found');
    }

    return results;
  }

  render(){
    let results = this.searchResults().map((name, i) => {
      return (
        <li key={i} onClick={this.enterName}>{name}</li>
      );
    });
    return (
      <div className='auto'>
        <h1>Autocomplete</h1>
        <input
          onChange={this.handleInput}
          value={this.state.inputVal}
          placeholder='Search...'/>
        <ul>
          {results}
        </ul>
      </div>
    );
  }
}
