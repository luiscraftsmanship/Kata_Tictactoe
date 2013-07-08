Given /^I'm not playing yet$/ do
end

When /^I start a new game$/ do
  input = Input.new
  output = Output.new
  @game = Game.new output, input
  @board = Board.new
end

Then /^I\ can\ insert\ (\d+) like\ position$/ do |valid|
  @game.is_valid?(valid).should == true
end

Then /^I\ can't\ insert\ (\d+) like\ position$/ do |invalid|
  @game.is_valid?(invalid).should == false
end

And /^The\ position\ is\ (valid|invalid)$/ do |validate_digit|
  valid_random = Random.new.rand(0..8)
  invalid_random = Random.new.rand(9..100)
  case validate_digit
  when 'valid'
    @game.is_valid?(valid_random).should == true
  when 'invalid'
    @game.is_valid?(invalid_random).should == false	  
  end
end

And /^The\ space\ on\ board\ is\ (empty|filled)$/ do |validate_space|
  valid = Random.new.rand(0..8)
  case validate_space
  when 'empty'
    @board.is_empty?(valid).should == true
  when 'filled'	  
    #@board.is_empty?(ll).should == false
  end
end

Then /^I\ can\ do\ a\ mark\ like\ player (X|O)$/ do |turn|
  case turn
  when 'X'
    @board.move 0, 'X'
  when 'O'
    @board.move 1, 'O'
  end
end

And /The game advance turn/ do
  @game.advance_turn
end


