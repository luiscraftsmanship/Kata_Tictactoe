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

=begin  
  def find_winner
    winning_state do |positions|
    # . . . for implementation
    end
  end

  def winning_state
    yield[ 0,1,2 ]
    yield[ 3,4,5 ]
    yield[ 6,7,8 ]
    yield[ 0,3,6 ]
    yield[ 1,4,7 ]
    yield[ 2,5,8 ]
    yield[ 0,4,8 ]
    yield[ 2,4,6 ]
  end
=end  

  def over?
    @board.check_winner
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
      output.error_message end
  end

  def notify_results
    output.congratulation
    @board.show
  end

  def advance_turn
    self.turn = ( @turn == X  ? O : X )
  end
end
