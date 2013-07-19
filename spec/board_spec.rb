require 'board'

describe Board, "Tictactoe" do

  let(:board) { Board.new }
  let(:output) { Output.new }
  let(:input) { Input.new }
  let(:game) { Game.new output, input }

  describe "initialize board" do
    it "sets board as array[] of ' '" do
      board.board.should == [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
    end

    it "sets board as [](default)" do
      board.board.should be_kind_of Array
    end

    it "values of the board" do
      board.should_not be_nil
      expect( board.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  it "checks board receive player X" do
    board.to_move 0, 'X'
    board.board[0].should include("X")
  end

  it "checks board receive player O" do
    board.to_move 1, 'O'
    board.board[1].should include("O")
  end

  it "marks the board after moving" do
    board.to_move 0, 'X'
    board.board.should == ["X", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  describe "evaluate the winner" do
    it "checks row 1 filled" do
     board.to_move 0, 'X'
     board.to_move 1, 'X'
     board.to_move 2, 'X'
     board.theres_winner?.should == true
    end

    it "checks row 2 filled" do
      board.to_move 3, 'X'
      board.to_move 4, 'X'
      board.to_move 5, 'X'
      board.theres_winner?.should == true
    end

    it "checks row 3 filled" do
      board.to_move 6, 'X'
      board.to_move 7, 'X'
      board.to_move 8, 'X'
      board.theres_winner?.should == true
    end

    it "checks column 1 filled" do
      board.to_move 0, 'X'
      board.to_move 3, 'X'
      board.to_move 6, 'X'
      board.theres_winner?.should == true
    end

    it "checks column 2 filled" do
      board.to_move 1, 'X'
      board.to_move 4, 'X'
      board.to_move 7, 'X'
      board.theres_winner?.should == true
    end

    it "checks column 3 filled" do
      board.to_move 2, 'X'
      board.to_move 5, 'X'
      board.to_move 8, 'X'
      board.theres_winner?.should == true
    end

    it "checks diagonal 1 filled" do
      board.to_move 0, 'X'
      board.to_move 4, 'X'
      board.to_move 8, 'X'
      board.theres_winner?.should == true
    end

    it "checks diagonal 2 filled" do
      board.to_move 2, 'X'
      board.to_move 4, 'X'
      board.to_move 6, 'X'
      board.theres_winner?.should == true
    end

    before { board.board = [ "X", "O", " ", " ", " ", " ", "X", "O", "X" ] }

    it "puts different pieces in board" do
      board.theres_winner?.should be_false
      board.to_move 2, 'X'
      board.to_move 3, 'O'
      expect(board.board).to eq(["X", "O", "X", "O", " ", " ", "X", "O", "X"])
    end
  
  end
                         
end
