require_relative 'piece'

class NullPiece < Piece

  # include Singleton

  def initialize
    @sym = " "
  end
end
