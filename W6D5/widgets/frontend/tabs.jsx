import React from 'react';

export default class Tabs extends React.Component {
  constructor(props){
    super(props);
    this.state = { selectedPane: 0 };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e){
    const targetPaneIdx = e.currentTarget.dataset.id;
    this.setState({ selectedPane: targetPaneIdx });
  }

  render(){
    let selectedPane = this.props.panes[this.state.selectedPane];
    let panes = this.props.panes.map((pane, i) => {
      return <h2 onClick={this.handleClick} data-id={i} key={i}>{pane.name}</h2>;
      });

    return (
      <div className='tabs'>
        <h1>Tabs</h1>
        <ul>
          {panes}
        </ul>
        <article>
          { selectedPane.content }
        </article>
      </div>
    );
  }
}
