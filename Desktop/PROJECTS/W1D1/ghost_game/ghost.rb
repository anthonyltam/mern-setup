require_relative 'human_player'

class GhostGame

  def read_dictionary
    File.readlines('dictionary.txt').map(&:chomp)
  end

  def initialize(player_one, player_two, dictionary)
    @player_one = player_one
    @player_two = player_two
    @dictionary = dictionary
    @current_player = player_one
    @fragment = ""
  end

  def take_turn(player)
    guess = player.get_move
    @fragment += guess if valid_play?(guess)
  end

  def valid_play?(letter)
    potential_word = @fragment += letter
    dictionary.any? { |word| word.include?(potential_word) }
  end

  def next_player!
    if @current_player == @player_two
      @current_player = @player_one
    else
      @current_player = @player_two
    end
  end

  def display_board
    puts "Word so far: #{@fragment}"
  end

  def play
    display_board
    until won?
      take_turn
      display_board
      next_player!
    end
    puts "GAME OVER!"
  end

  def won?
    return true if @dictionary.include?(@fragment)
    false
  end


end



if __FILE__ == $PROGRAM_NAME
  dictionary = GhostGame.read_dictionary
  player_one = Player.new
  player_two = Player.new

  game = GhostGame.new(player_one, player_two, dictionary)
  p 'LETS PLAY GHOST!'
  game.play
end





#
