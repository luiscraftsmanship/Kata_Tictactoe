require 'board'

class Game

  X = 'X'.freeze
  O = 'O'.freeze

  attr_accessor :output, :input, :turn

  def initialize( output, input )
    self.output = output
    self.input = input
    self.turn = X
    @board = Board.new
  end
 
  def is_valid? position
    result = (0..8).include?(position.to_i)
    return result
  end
 
  def over?
    @board.check_winner or is_tie_game?
  end

  def starts
    take_turn until over?
    notify_results 
  end

  def take_turn
    output.ask_for_move turn
    @board.show
    validate_move input.get_turn.to_i 
  end

  def can_move? move
    return false if over?
    is_valid? move
  end

  def validate_move move
    if ( can_move? move.to_i ) && ( @board.is_empty? move.to_i )
      @board.to_move move.to_i, turn
      advance_turn
    else
      output.error_message end	    
  end

  def notify_results
    output.show_results  
    @board.show   
  end

  def advance_turn
    self.turn = ( @turn == X  ? O : X )
  end

  def is_tie_game?
    return @board.board.select{|position| position == ' '}.count == 0
  end
end
