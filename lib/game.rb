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
 
  def is_valid?(position)
    result = (0..8).include?( position.to_i )
    return result
  end

  
  def over?
    @board.check_winner or is_tie_game?
  end

  def play
    take_turn until over?
    notify_results 
  end

  def take_turn
    output.ask_for_move turn
    @board.show
    validate_move
    @board.check_winner
  end

  def validate_move
    position = input.get_turn.to_i
    if (is_valid? position.to_i) && (@board.is_empty? position.to_i)
      @board.move position.to_i, turn
      advance_turn
    else
      output.error_message 
    end
  end

  def notify_results
    output.congratulation unless is_tie_game?
    output.tie_game
    @board.show
  end

  def advance_turn
    self.turn = ( @turn == X  ? O : X )
  end

  def is_tie_game?
	  return @board.board.select{|position| position == ' '}.count == 0
  end
end
