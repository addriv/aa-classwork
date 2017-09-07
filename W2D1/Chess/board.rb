require_relative 'king'
require_relative 'knight'
require_relative 'null_piece'
require_relative 'pawn'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'display'
require 'byebug'

class Board
  NULL = NullPiece.new

  attr_accessor :grid

  def initialize
    @grid = Array.new(8){Array.new(8)}
    populate
  end

  def populate
    @grid.each_index do |row|
      @grid.each_index do |space|
        color = :black if row.zero? || row == 1
        color = :white if row == 6 || row == 7
        pos = [row, space]

        if row == 0 || row == 7
          populate_last_row(row, space, color)
        elsif row == 1 || row == 6
          self[pos] = Pawn.new(color, pos, self)
        else
          self[pos] = NULL
        end

      end
    end
  end

  def populate_last_row(row, space, color)
    pos = [row, space]
    if space.zero? || space == 7
      self[pos] = Rook.new(color, pos, self)
    elsif space == 1 || space == 6
      self[pos] = Knight.new(color, pos, self)
    elsif space == 2 || space == 5
      self[pos] = Bishop.new(color, pos, self)
    elsif space == 3
      self[pos] = Queen.new(color, pos, self)
    elsif space == 4
      self[pos] = King.new(color, pos, self)
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)

    raise "No piece found" if self[start_pos].is_a?(NullPiece)
    if self[start_pos].moves.include?(end_pos)
      self[end_pos] = self[start_pos]
      self[start_pos] = NULL
      self[end_pos].current_pos = end_pos
    end
  end


  def in_bounds?(pos)
    pos.all?{|n| (0..7).include?(n)}
    # self[pos] != nil
  end

  def in_check?(color)
    possible_moves = []
    @grid.each do |row|
      row.each do |piece|
        possible_moves += piece.moves unless piece.is_a?(NullPiece)
      end
    end

    possible_moves.each do |move|
      return true if self[move].is_a?(King) && color == self[move].color
    end

    false
  end

  def checkmate

  end

end

if __FILE__ == $PROGRAM_NAME
  a = Board.new
  display = Display.new(a)
  display.loop
end
