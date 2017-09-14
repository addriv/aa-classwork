import React from 'react';
import { Route } from 'react-router-dom';

export default class ItemDetail extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    const item = this.props.items[this.props.match.params.itemId];
    return (
      <ul>
        <li>{item.name}</li>
        <li>{item.happiness}</li>
        <li>{item.price}</li>
      </ul>
    );
  }
}
