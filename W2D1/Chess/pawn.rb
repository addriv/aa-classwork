require_relative 'piece'

class Pawn < Piece
  def initialize(color, pos, board)
    @sym = "P"
    super
  end

  def moves
    case @color
    when :white
      dir = -1
    when :black
      dir = 1
    end
    move_diagonal(dir) + move_vertical(dir)
  end

  def move_diagonal(dir)
    moves = [
      add_pairs(@current_pos, [dir, -1]),
      add_pairs(@current_pos, [dir, 1])
    ]
    moves = moves.select {|move| @board.in_bounds?(move)}

    moves.select do |move|
      @board[move].color != @color && @board[move].color
    end

  end

  def move_vertical(dir)
    moves = []

    if check_board([dir, 0]).is_a?(NullPiece)
      moves << add_pairs(@current_pos, [dir, 0])
      if starting_position?
        if check_board([dir * 2, 0]).is_a?(NullPiece)
          moves << add_pairs(@current_pos, [dir * 2, 0])
        end
      end
    end

    moves.select {|move| @board.in_bounds?(move)}
  end

  def starting_position?
    return true if @color == :white && @current_pos[0] == 6
    return true if @color == :black && @current_pos[0] == 1
    false
  end

  def check_board(diff_pos)
    @board[add_pairs(@current_pos, diff_pos)]
  end

end
