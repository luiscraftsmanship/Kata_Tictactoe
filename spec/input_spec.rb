require 'input'
require 'stringio'
 
class TicTacToe

  describe 'Input' do

    it 'returns the turn as an integer' do
      stdin_mock = StringIO.new '5\n6\n'
      Input.new(stdin_mock).get_turn.should == 5
    end

  end
end
