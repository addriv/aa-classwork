require_relative 'piece'
require_relative 'module'

class Rook < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    @sym = "R"
    @move_dir = [
    [0,1],
    [1,0],
    [0,-1],
    [-1,0]
    ]
    super
  end
end
