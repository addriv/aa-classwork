const Game = require("./game.js");

class GameView {
  constructor(game, ctx){
    this.game = game;
    this.ctx = ctx;
  }

  start(){
    setInterval(Game.prototype.moveObjects, 20, 20);
  }
}

module.exports = GameView;
