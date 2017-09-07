require_relative 'piece'
require_relative 'module'

class Knight < Piece
  include SteppingPiece

  def initialize(color, pos, board)
    @sym = "N"
    @move_dir = [
      [-1,2],
      [1,2],
      [2,1],
      [2,-1],
      [1,-2],
      [-1,-2],
      [-2,-1],
      [-2,1]
    ]
    super
  end
end
