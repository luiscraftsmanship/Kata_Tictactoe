class MockOutput

  def initialize
    @counter_move = 0
  end

  def ask_for_move(turn)
    @counter_move += 1
  end

end
