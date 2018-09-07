class Player

  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def get_move
    p "Please input a character:"
    input = gets.chomp
  end


end
