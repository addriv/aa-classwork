class Piece

  attr_reader :color, :sym, :board
  attr_accessor :current_pos, :selected

  def initialize(color, pos, board)
    @color = color
    @current_pos = pos
    @board = board
    @selected = false
  end

  def add_pairs(arr1, arr2)
    arr1.zip(arr2).map { |pair| pair.reduce(:+) }
  end

  def valid_move(pos)
    return false unless @board.in_bounds?(pos)
    return false if @board[pos].color == @color
    new_board = @board.dup
    new_board.move_piece(@current_pos, pos)
    return false if new_board.in_check?(@color)

    true
  end
end
