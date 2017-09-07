require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    p " #{(0..7).to_a.join(" ")}"
    @board.grid.each_with_index do |row, i|
      print "#{i} "
        row.each_with_index do |space, ind|
          if @cursor.selected_pos == [i, ind] && @cursor.selected
            print "#{space.sym.colorize(:color => :white, :background => :red)} "
          elsif @cursor.cursor_pos != [i, ind]
            print "#{space.sym} "
          else
            print "#{space.sym.colorize(:color => :white, :background => :blue)} "
          end
        end
        print "\n"
    end
  end

  def loop
    until false
      system("clear")
      render
      p "Board in check:#{@board.in_check?(:white)}"
      @cursor.get_input
    end
  end

end
