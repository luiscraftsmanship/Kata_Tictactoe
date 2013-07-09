require 'board'

class Output 

  attr_accessor :board	

  def initialize
    @board = Board.new
  end

  def start_message
    output.puts 'Welcome to the Tictactoe game'
  end

  def ask_for_move( turn, output=$stdout )
    output.print "Where would you like to move player #{turn}? "
    output.print "Please insert a digit between [ 0-8 ]: "
  end

  def show_results( output=$stdout )
    output.puts "", "There is a winner!"
  end

=begin  
  def tie_game( output=$stdout )
    output.print "This game is tie"
  end
=end
=begin  
  def show_board( output=$stdout )
    output.print "\n\n"
    output.print " #{@board.board[0]} |"
    output.print " #{@board.board[1]} |"
    output.print " #{@board.board[2]}  "
    output.print "\n---+---+---\n"
    output.print " #{@board.board[3]} |"
    output.print " #{@board.board[4]} |"
    output.print " #{@board.board[5]}  "
    output.print "\n---+---+---\n"
    output.print " #{@board.board[6]} |"
    output.print " #{@board.board[7]} |"
    output.print " #{@board.board[8]}  "
    output.print "\n\n"
  end
=end  

  def error_message( output=$stdout ) 
    output.puts "", "Digit invalid or position is not empty? "
  end

=begin  
  def congratulation ( output=$stdout )
    output.puts "", "Congratulations, there is the winner!!! "
  end
=end
end
