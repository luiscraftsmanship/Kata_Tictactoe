class Board

  attr_accessor :board 

  def initialize( board=[] )
    raise Exception unless board.is_a? Array
    @board = board
    @board = [].fill( 0,9 ) { ' ' }
  end

  def show
    print "\n\n"
    print " #{@board[0]} |"
    print " #{@board[1]} |"
    print " #{@board[2]}  "
    print "\n---+---+---\n"
    print " #{@board[3]} |"
    print " #{@board[4]} |"
    print " #{@board[5]}  "
    print "\n---+---+---\n"
    print " #{@board[6]} |"
    print " #{@board[7]} |"
    print " #{@board[8]}  "
    print "\n\n"
  end

  def is_empty? position
    result = @board.at( position.to_i ) != ' '
    return !result
  end

  def move position, turn
    @board.delete_at( position.to_i )
    @board.insert( position.to_i, turn.to_s )
  end
 
  def row_1_filled?
    fills = @board.values_at( 0,1,2 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def row_2_filled?
    fills = @board.values_at( 3,4,5 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def row_3_filled?
    fills = @board.values_at( 6,7,8 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def column_1_filled?
    fills = @board.values_at( 0,3,6 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def column_2_filled?
    fills = @board.values_at( 1,4,7 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def column_3_filled?
    fills = @board.values_at( 2,5,8 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def diagonal_1_filled?
    fills = @board.values_at( 0,4,8 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def diagonal_2_filled?
    fills = @board.values_at( 2,4,6 ).uniq
    fills.length == 1 && fills[0] != " "
  end

  def check_winner
    row_1_filled? || row_2_filled? || row_3_filled? ||
    column_1_filled? || column_2_filled? || column_3_filled? ||
    diagonal_1_filled? || diagonal_2_filled?
  end
end
