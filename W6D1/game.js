const Asteroid = require("./asteroid.js");

const DEFAULTS = {
  DIM_X: 1000,
  DIM_Y: 600,
  NUM_ASTEROIDS: 5,
  BG_COLOR: "#000000"
};

class Game {
  constructor(){
    this.asteroids = [];
    this.addAsteroids();
  }

  addAsteroids(){
    while (this.asteroids.length < DEFAULTS.NUM_ASTEROIDS){
      this.asteroids.push(new Asteroid({ game: this }));
    }
  }

  randomPosition(){
    return [
      DEFAULTS.DIM_X * Math.random(),
      DEFAULTS.DIM_Y * Math.random()
    ];
  }

  draw(ctx){
    ctx.clearRect(0, 0, DEFAULTS.DIM_X, DEFAULTS.DIM_Y);
    ctx.fillStyle = DEFAULTS.BG_COLOR;
    ctx.fillRect(0, 0, DEFAULTS.DIM_X, DEFAULTS.DIM_Y);

    this.allObjects().forEach((object) => {
      object.draw(ctx);
    });
  }

  moveObjects(timeDelta){
    this.asteroids.forEach(el => {
      el.move(timeDelta);
    });
  }
}

module.exports = Game;
