import React from 'react';
import Util from '../../util/util';

export default class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { id: '', title: '', body: '', done: false };
    // this.handleTitleInput = this.handleTitleInput.bind(this);
    // this.handleBodyInput = this.handleBodyInput.bind(this);
    // this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(inputType) {
    return (event) => {this.setState({ [inputType]: event.target.value });};
  }

  // handleTitleInput(event) {
  //   this.setState({ title: event.currentTarget.value });
  // }
  //
  // handleBodyInput(event) {
  //   this.setState({ body: event.currentTarget.value });
  // }

  handleSubmit(event) {
    event.preventDefault();
    this.setState({ id: Util.uniqueId()},
                    () => this.props.createTodo(this.state).then(
                      () => this.setState({ id: '', title: '',
                        body: '', done: false })
                    ));
    // this.props.receiveTodo(this.state);
  }

  displayErrors() {
    return (
      <div className="errors">
        {
          this.props.errors.map((error, idx) => (
            <li key={idx}>{error}</li>
          ))
        }
        <br></br>
      </div>
    );
  }

  render() {
    return (
      <div>
        {this.displayErrors.bind(this)()}
        <label>Title: </label>
        <input onChange={this.handleInput('title')} value={this.state.title}/>
        <br></br>
        <br></br>
        <label>Body: </label>
        <textarea onChange={this.handleInput('body')} value={this.state.body}/>
        <br></br>
        <br></br>
        <button onClick={this.handleSubmit}>Create Todo!</button>
      </div>
    );
  }
}
