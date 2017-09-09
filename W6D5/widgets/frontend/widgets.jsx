import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
// import Weather from './weather';
import AutoComplete from './autocomplete';
import Tabs from './tabs';

const Names = [
  'Adrian',
  'Kevin',
  'Derrick',
  'Connor',
  'Brian',
  'Tommy',
  'Rebekah',
  'David',
  'Jerry',
  'Mike',
  'Nixon',
  'Betty',
  'Jimmy',
  'Carmen'
];

const Panes = [
  { name: 'Tab 1', content: 'First tab content' },
  { name: 'Tab 2', content: 'Second tab content' },
  { name: 'Tab 3', content: 'Third tab content' },
];

class Root extends React.Component {
  render() {
    return(
      <div>
        <ul className='widgets'>
          <Clock />
          <AutoComplete names={Names} />
          <Tabs panes={Panes} />
        </ul>
      </div>
    );
  }
}


document.addEventListener('DOMContentLoaded', function(){
  ReactDOM.render(<Root/>, document.getElementById('main'));
});
