class Input

  def initialize( source = $stdin )
    @source = source
  end

  def get_turn
    @source.gets.to_i
  end

end
