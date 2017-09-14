import React from 'react';

export default class Clock extends React.Component {
  constructor(props){
    super(props);
    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
  }

  render(){
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    return (
      <div className='clock'>
        <h1>Clock</h1>
        <div>{hours}:{minutes}:{seconds}</div>
      </div>
    );
  }

  componentDidMount(){
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    this.intervalId.clearInterval();
  }

  tick(){
    this.setState({ time: new Date() });
  }
}
