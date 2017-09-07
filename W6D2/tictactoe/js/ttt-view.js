class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.board = this.setupBoard();
    this.bindEvents();
    // this.el.append(setupBoard());
  }

  bindEvents() {
    $('li').on("click", e => {
      let target = $(e.currentTarget);
      let data = target.data('pos');
      this.makeMove(target);
      this.game.playMove(data);

      if (this.game.winner()){
        window.setTimeout(() => alert(`${this.game.winner()} has won!`), 10);
        // alert(`${this.game.winner()}`);
        $('li').off();
      }
    });

    $('li').hover(function(e){
      let target = $(e.currentTarget);
      target.css("background-color", 'yellow');
    }, function(e){
      let target = $(e.currentTarget);
      target.css("background-color", 'grey');});
  }

  makeMove($square) {
    $square.text(this.game.currentPlayer);
    $square.css("text-align", 'center');
    $square.css("font-size", '150px');
    $square.css("background-color", 'white');
    $square.off();
  }

  setupBoard() {
    const ul = document.createElement("ul");
    this.el.append(ul);

    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        let li = document.createElement("li");
        ul.append(li);
        $('li').eq(-1).data("pos", [i, j]);
      }
    }


    $('ul').css({
      "width": '600px',
      "height": '600px'
    });

    $('li').css({
      "background-color": 'grey',
      "width": '200px',
      "height": '200px',
      "float": 'left',
      "list-style": 'none',
      "outline": '1px solid blue'
    });

  }
}

module.exports = View;
