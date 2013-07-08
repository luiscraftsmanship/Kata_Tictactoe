Feature: The Tictactoe game
  As a tictactoe player
  I want to play a tictactoe game
  So I can play

  Background: Starting new match
    Given: I'm not playing play
    When: I start a new game

  Scenario: Inputing a valid position
    When I start a new game
    Then I can insert 0 like position
    And The position is valid

  Scenario: Inputing a invalid position
    When I start a new game
    Then I can't insert 9 like position
    And The position is invalid

  Scenario: The space on board is empty
    When I start a new game
    Then I can insert 0 like position 
    And The position is valid
    And The space on board is empty

  Scenario: Marks the board like player X
    When I start a new game
    Then I can insert 0 like position
    And The position is valid
    And The space on board is empty
    Then I can do a mark like player X
    
  Scenario: The game advance turn
    When I start a new game
    Then I can do a mark like player X
    And The game advance turn

  Scenario: Marks the board like player O
    When I start a new game
    Then I can do a mark like player X
    And The game advance turn
    Then I can do a mark like player O

  Scenario: The space on board isn't empty
    When I start a new game
    Then I can insert 0 like position
    And The position is valid
    And The space on board is empty
    Then I can do a mark like player X
    And The game advance turn
    Then I can insert 0 like position
    And The position is valid
    #And The position isn't empty
   

