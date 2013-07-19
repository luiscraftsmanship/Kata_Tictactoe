require 'game'
require 'input'
require 'output'
require 'board'

describe Game, "Tictactoe" do

  let(:x) { Game::X }
  let(:o) { Game::O }
  let(:input) { Input.new }
  let(:output) { Output.new }
  let(:game) { Game.new output, input }
  let(:board) { Board.new }

  it "is X's turn by default" do
    game.turn.should == x
  end

  it "describe advance turn after moving" do
    game.turn.should == x
    board.to_move 0, game.turn
    game.advance_turn
    game.turn.should == o
    board.to_move 1, game.turn
    game.advance_turn
    game.turn.should == x
  end

  it "describe available moves ( 0-8 )" do
    position = 5	  
    game.is_valid?(position).should == true
  end

  it "checks input valid" do
    position = 0	  
    game.is_valid?(position).should == true
  end

  it "checks input invalid" do
    position = 9
    game.is_valid?(position).should == false
  end

  it "validate empty position" do
    position = 0
    game.is_valid?(position).should == true
    board.is_empty?(position).should == true
  end

  it "checks space empty & input valid" do
    position = 0
    game.is_valid?(position).should == true
    board.is_empty?(position).should == true
    board.to_move position, 'X'
    position = 0
    game.is_valid?(position).should == true
    board.is_empty?(position).should == false
  end

end
