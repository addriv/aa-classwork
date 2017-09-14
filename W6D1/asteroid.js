const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

const DEFAULTS = {
  COLOR: "#505050",
  RADIUS: 10,
  SPEED: 4
};

class Asteroid extends MovingObject {
  constructor(options = {}){
    options.pos = options.pos || options.game.randomPosition();
    options.vel = Util.randomVec(DEFAULTS.SPEED);
    options.radius = DEFAULTS.RADIUS;
    options.color = DEFAULTS.COLOR;
    super(options);
  }
}
module.exports = Asteroid;
