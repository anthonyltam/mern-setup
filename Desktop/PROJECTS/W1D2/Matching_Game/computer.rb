require_relative "board"

class Computer

  attr_accessor :name, :board, :known_cards, :matched_cards, :available_positions

  def initialize(name, board)
    @name = name
    @board = board.board
    @known_cards = Hash.new {|h,k| h[k] = []}
    @matched_cards = []
    @available_positions = []
  end

  def guess
    guess = random_guess
    guesses.each do |guess|
      update_pool_2(guess)
    end
  end


  # private
  # all helper methods ..
  def set_up_known_cards
    positions = self.available_positions
    positions.each do |pos|
      self.known_cards[pos] = nil
    end
    p self.known_cards
  end

  def update_pool_2(guess)
    row, col = guess
    self.known_cards[self.board[row][col]] << [row,col]
  end

  def update_knowledge(guess)
    guess1 , guess2 = guess
    self.known_cards[guess1] == self.board[guess1[0]][guess1[1]]
    self.known_cards[guess2] == self.board[guess2[0]][guess2[1]]
  end

  def random_guess
    guess = self.available_positions.sample
    self.available_positions -= guess
    guess2 = self.available_positions.sample
    self.available_positions -= guess2
    [guess,guess2]
  end

  def update_available_positions
    self.board.each_with_index do |el, row|
      el.each_index do |col|
        unless self.board[row][col].nil?
          self.board[row][col].nil?
          self.available_positions << [row, col]
        end
      end
    end
  end

end

b = Board.new
b.populate
c = Computer.new("computer",b)
c.available_positions
c.update_available_positions
c.available_positions.sample
p c.set_up_known_cards



KC = Hash.new {|h,k| h[k] = []}

KC[board[row][col]] << row, col
if KC[board][row][col].length == 2 # perfect guess
