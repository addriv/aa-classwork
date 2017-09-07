require 'byebug'

module SlidingPiece
  def moves
    moves = []
    @move_dir.each do |dir|
      pos = add_pairs(@current_pos, dir)
      while valid_move(pos)
        moves << pos
        break if @board[pos].color && @board[pos].color != @color
        pos = add_pairs(pos, dir)
      end
    end
    moves
  end

end

module SteppingPiece
  def moves
    moves = []
    @move_dir.each do |dir|
      pos = add_pairs(@current_pos, dir)
      moves << pos if valid_move(pos)
    end
    moves
  end
end
