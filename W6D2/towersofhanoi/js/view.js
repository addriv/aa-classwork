class View {
  constructor(game, rootEl){
    this.game = game;
    this.rootEl = rootEl;
    this.setupTowers();
    this.render();
    this.firstClick = null;
    this.clickTower();
  }

  setupTowers(){
    for(let i = 0; i < 3; i++){
      const $ul = document.createElement('ul');
      $('.hanoi').append($ul);
      $('ul').eq(-1).data("col", i);
      console.log($('ul').eq(-1).data("col"));
      for(let j = 0; j < 3; j++){
        let li = document.createElement('li');
        $ul.append(li);
        $('li').eq(-1).data("pos", j);
      }
    }
  }

  render(){
    $('li').remove();
    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        let piece = this.game.towers[i].slice(0).reverse()[j];
        if (piece){
          let li = document.createElement('li');
          $('ul').eq(i).append(li);
          $('li').eq(-1).addClass(`disk-${piece}`);
        } else {
          let li = document.createElement('li');
          $('ul').eq(i).prepend(li);
        }
      }
    }
  }

  clickTower(){
    $('ul').on("click", event =>{
      const target = $(event.currentTarget);
      if (this.firstClick === 0 || this.firstClick){
        if (!this.game.move(this.firstClick, target.data("col"))){
          alert("invalid move");
        }
        this.firstClick = null;
        this.render();
      } else {
        this.firstClick = target.data("col");
      }
      if (this.game.isWon()){
        window.setTimeout(() => {
          alert("Congratulations you won!");
        }, 10);
      }
    });
  }
}

module.exports = View;
