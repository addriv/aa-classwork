import React from 'react';

export default class TodoListItem extends React.Component {
  constructor(props){
    super(props);
    // DO NOT DO THIS, THIS IS ONLY RAN ONCE
    // this.state = props.item;
    // this.removeTodo = props.removeTodo;
    // this.receiveTodo = props.receiveTodo;
    this.handleRemove = this.handleRemove.bind(this);
    this.handleStatus = this.handleStatus.bind(this);
  }



  handleRemove(event){
    event.preventDefault();
    this.props.removeTodo(this.props.item);
    // this.setState(
    //   { id: undefined, title: undefined, body: undefined, done: undefined }
    // );
  }

  handleStatus(event){
    event.preventDefault();
    // this.setState({ done: !this.props.item.done },
    //               () => this.props.receiveTodo(this.props.item));
    this.props.item.done = !this.props.item.done;
    // debugger;
    this.props.updateTodo(this.props.item);
  }


  render(){
      if (this.props.item.id) {
        let status = this.props.item.done ? "Undo" : "Done";
        return (
          <li key={this.props.item.id}>
            <h3>{this.props.item.title}</h3>
            <button
              key={"remove" + this.props.item.id}
              onClick={this.handleRemove}>Remove</button>
            <button
              key={"status" + this.props.item.id}
              onClick={this.handleStatus}>{status}</button>
          </li>
        );
      }
  }
}
