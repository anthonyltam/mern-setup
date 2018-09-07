require 'byebug'

require_relative "player"
require_relative "board"


class Game

  def self.setup(player_name)
    p = Player.new(player_name)
    b = Board.new
    g = Game.new(p,g)
  end


  attr_accessor :player , :board

  def initialize(player,board)
    @player = player
    @board = board
  end

  def play_turn
    guess = self.player.guess
    self.board.reveal(guess)
    self.board.update_board(guess) if self.board.is_match?(guess)
    self.board.update_apparent_board
    self.board.print_render
  end

  def play_game
    # populates the board with random numbers
    self.board.populate
    self.board.update_apparent_board
    self.board.print_render
    until self.board.won?
      self.play_turn
    end
    p "Game Over!"
  end

end
p = Player.new("coolbeans")
b = Board.new
g = Game.new(p,b)
g.play_game
