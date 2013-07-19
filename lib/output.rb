require 'board'

class Output 

  attr_accessor :board	

  def initialize
    @board = Board.new
  end

  def ask_for_move( turn, output=$stdout )
    output.print "Where would you like to move player #{turn}? "
    output.print "Please insert a digit between [ 0-8 ]: "
  end

  def show_results( output=$stdout )
    output.puts "", "Game finished"
  end

  def error_message( output=$stdout ) 
    output.puts "", "Digit invalid or position is not empty? "
  end

end
