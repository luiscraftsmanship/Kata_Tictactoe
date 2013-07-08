require 'stringio'
require 'output'
 
class TicTacToe

  describe 'Output' do

  let(:stdout_mock) do

    Class.new do

      def initialize
        @seen = StringIO.new ""
      end

      def puts(*strings)
        @seen.puts(*strings)
      end

      def print(string)
        @seen.print string
      end

      def has_seen?(text)
        @seen.rewind
        !!@seen.read[text]
      end
    end.new
  end

    describe 'ask_for_move' do
    
      it 'display ask for move message' do
        Output.new.ask_for_move('X', stdout_mock)
      end

      it 'prompts for input first time' do
        Output.new.ask_for_move('X', stdout_mock)
        stdout_mock.should have_seen 'X'
        stdout_mock.should_not have_seen 'Y'
        stdout_mock.should have_seen '?'
      end
    end
  end
end
