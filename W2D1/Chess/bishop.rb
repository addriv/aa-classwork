require_relative 'piece'
require_relative 'module'

class Bishop < Piece
  attr_reader :move_dir

  include SlidingPiece

  def initialize(color, pos, board)
    @sym = "B"
    @move_dir = [[1, 1], [1, -1], [-1, -1],[-1, 1]]
    super
  end

end
