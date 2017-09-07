require_relative 'piece'
require_relative 'module'

class Queen < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    @sym = "Q"
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
