const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {
  constructor(){
    this.stacks = [[3, 2, 1], [], []];
  }

  promptMove(){
    console.log(this.stacks);
    reader.question("Which stack do you want to move from?", (fromStack) => {
      reader.question("Which stack do you want to move to?", (toStack) => {
        console.log(`Move from ${fromStack} to ${toStack}`);
        this.move(parseInt(fromStack), parseInt(toStack));
      });
    });
  }

  move(startTowerIdx, endTowerIdx){
    const isValid = this.isValidMove(startTowerIdx, endTowerIdx);
    if (isValid){
      let piece = this.stacks[startTowerIdx].pop();
      this.stacks[endTowerIdx].push(piece);
    }
  }

  isValidMove(startTowerIdx, endTowerIdx){
    const startPiece = this.stacks[startTowerIdx].slice(-1)[0];
    const endPiece = this.stacks[endTowerIdx].slice(-1)[0];

    if (this.stacks[startTowerIdx].length === 0) {
      return false;
    }
    else if (this.stacks[endTowerIdx].length  === 0 ) {
      return true;
    }
    else if (startPiece > endPiece) {
      return false;
    }
    else if (
      startTowerIdx > 2 || startTowerIdx < 0 ||
      endTowerIdx > 2 || endTowerIdx < 0) {
        return false;
      }
    else {
      return true;
    }
  }

  isWon(){
    return this.stacks[1].length === 3 || this.stacks[2].length === 3;
  }

  run(completionCallback){
    this.promptMove();

    while (this.isWon() === false){
      run(completionCallback);
    }

    completionCallback();
  }


}

const newGame = new Game();
// newGame.promptMove();
