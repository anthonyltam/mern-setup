class Board

  attr_accessor :board , :apparent_board

  def initialize
    @board = Array.new(2) {Array.new(2)}
    @apparent_board = Array.new(2) {Array.new(2)}
  end

  def populate
    # tested
    half = (1..2).to_a
    numbers = (half + half).shuffle
    self.board.each_with_index do |el,row|
      el.each_index do |pos|
        self.board[row][pos] = numbers.pop
      end
    end
  end

  def print_render
    # tested
    p 'this is the board:'
    self.apparent_board.each do |line|
      p line
    end
    p ""
  end

  def update_apparent_board
    self.board.each_with_index do |el,row|
      el.each_index do |pos|
        if self.board[row][pos].nil?
          self.apparent_board[row][pos] = "x"
        else
          self.apparent_board[row][pos] = "c"
        end
      end
    end
  end

  def won?
    # needs testing!!
    self.board.flatten.all?{|pos| pos.nil? }
  end
  #
  def reveal(guess_arr)
    # (1,1) (row,col)[3,4],[1,1]
    guess1, guess2 = guess_arr
    row1, col1 = guess1
    row2, col2 = guess2
    number1 = self.board[row1][col1]
    number2 = self.board[row2][col2]
    self.apparent_board[row1][col1] = number1
    self.apparent_board[row2][col2] = number2
    apparent_board.each do |line|
      p line
    end
  end

  def is_match?(guess_arr)
    guess1, guess2 = guess_arr
    row1, col1 = guess1
    row2, col2 = guess2
    number1 = self.board[row1][col1]
    number2 = self.board[row2][col2]
    number1 == number2
  end

  def update_board(guess_arr)
    guess1, guess2 = guess_arr
    row1, col1 = guess1
    row2, col2 = guess2
    self.board[row1][col1] = nil
    self.board[row2][col2] = nil
  end



end

# b = Board.new
# b.populate
# b.update_apparent_board
# b.reveal([1,1],[0,0])
# # b.update_apparent_board
# # b.print_render
