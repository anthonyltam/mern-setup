class Player

  attr_accessor :name

  def initialize(name, board)
    @name = name
    @board = nil
  end

  def guess
    p "Make 2 guesses. Example guess: 'row, col' "
    p "first guess:"
    guess1 = gets.chomp.split(', ').map(&:to_i)
    p "second guess:"
    guess2 = gets.chomp.split(', ').map(&:to_i)
    [guess1, guess2] if valid_guess?([guess1,guess2])

    # [row1,col1],[row2,col2]
  end

  private

  def valid_guess?(guesses)
    guesses.each do |guess|
      if guess.length != 2
        p "guess numbers not equal to 2"
        return false
      elsif guess[0].class != Integer
        p "guess 1 must be a number"
        return false
      elsif guess[1].class != Integer
        p "guess 2 must be a number"
        return false
      end
    end
    true
  end
end
