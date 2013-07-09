require 'board'

describe Board, "Tictactoe" do

  let(:board) { Board.new }

  it "sets board as array[] of ' '" do
    board.board.should == [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
  end

  it "sets board as [](default)" do
    board.board.should be_kind_of Array
  end

  it "checks board receive player X" do
    board.move 0, 'X'
    board.board[0].should include("X")
  end

  it "checks board receive player O" do
    board.move 1, 'O'
    board.board[1].should include("O")
  end

  it "marks the board after moving" do
    board.move 0, 'X'
    board.board.should == ["X", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  it "checks row 1 filled" do
   board.move 0, 'X'
   board.move 1, 'X'
   board.move 2, 'X'
   #board.row_1_filled?.should == true
   board.check_winner.should == true
  end

  it "checks row 2 filled" do
    board.move 3, 'X'
    board.move 4, 'X'
    board.move 5, 'X'
    #board.row_2_filled?.should == true
    board.check_winner.should == true
  end

  it "checks row 3 filled" do
    board.move 6, 'X'
    board.move 7, 'X'
    board.move 8, 'X'
    #board.row_3_filled?.should == true
    board.check_winner.should == true
  end

  it "checks column 1 filled" do
    board.move 0, 'X'
    board.move 3, 'X'
    board.move 6, 'X'
    #board.column_1_filled?.should == true
    board.check_winner.should == true
  end

  it "checks column 2 filled" do
    board.move 1, 'X'
    board.move 4, 'X'
    board.move 7, 'X'
    #board.column_2_filled?.should == true
    board.check_winner.should == true
  end

  it "checks column 3 filled" do
    board.move 2, 'X'
    board.move 5, 'X'
    board.move 8, 'X'
    #board.column_3_filled?.should == true
    board.check_winner.should == true
  end

  it "checks diagonal 1 filled" do
    board.move 0, 'X'
    board.move 4, 'X'
    board.move 8, 'X'
    #board.diagonal_1_filled?.should == true
    board.check_winner.should == true
  end

  it "checks diagonal 2 filled" do
    board.move 2, 'X'
    board.move 4, 'X'
    board.move 6, 'X'
    #board.diagonal_2_filled?.should == true
    board.check_winner.should == true
  end
                         
end
