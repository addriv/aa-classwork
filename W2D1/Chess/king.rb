require_relative 'piece'
require_relative 'module'

class King < Piece
  include SteppingPiece

  def initialize(color, pos, board)
    @sym = "K"
    @move_dir = [
      [-1,1],
      [1,1],
      [1,0],
      [1,-1],
      [0,-1],
      [-1,-1],
      [-1,0],
      [0,1]
    ]
    super
  end
end
