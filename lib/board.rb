class Board

  attr_accessor :board 

  def initialize( board=[] )
    raise Exception unless board.is_a? Array
    @board = board
    @board = [].fill( 0,9 ) { ' ' }
  end
 
  def show( output=$stdout )
    output.print "\n\n"
    output.print " #{@board[0]} |"
    output.print " #{@board[1]} |"
    output.print " #{@board[2]}  "
    output.print "\n---+---+---\n"
    output.print " #{@board[3]} |"
    output.print " #{@board[4]} |"
    output.print " #{@board[5]}  "
    output.print "\n---+---+---\n"
    output.print " #{@board[6]} |"
    output.print " #{@board[7]} |"
    output.print " #{@board[8]}  "
    output.print "\n\n"
  end

  def is_empty? position
    result = @board.at(position.to_i) != ' '
    return !result
  end

  def to_move position, turn
    @board.delete_at(position.to_i)
    @board.insert(position.to_i, turn.to_s)
  end

  def is_tie_game?
    return @board.select{|position| position == ' '}.count == 0
  end

  def theres_winner?
    return find_winner
  end

  def find_winner
    winners_moves.each do |move|
    fills = @board.values_at(*move).uniq
    result = fills.length == 1 && fills[0] != " "
    return true if result
    end
    return false
  end

 def winners_moves
    [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
    [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  end

end
