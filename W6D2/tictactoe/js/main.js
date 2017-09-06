const View = require('./ttt-view');
const Game = require('../game/game');

$( () => {
  let newGame = new Game();
  let newView = new View(newGame, $('.ttt'));

  window.game = newGame;
});
