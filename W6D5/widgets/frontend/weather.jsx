import React from 'react';

export default class Weather extends React.Component{
  constructor(props){
    super(props);
    this.state = { location: "" };
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.retreiveWeather);
  }

  retrieveWeather(location){
    // TODO: Will come back to weather app last...
  }

  render(){
    return (
      <div className='weather'>
        <p>This is the Weather!</p>
      </div>
    );
  }
}

navigator.geolocation.getCurrentPosition((pos) => {
  return console.log(pos);
});
