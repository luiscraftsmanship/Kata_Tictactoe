class MockInput

  def initialize( moves = "" )
    @moves = StringIO.new moves
  end

  def get_turn
    @moves.gets.to_i
  end
end
