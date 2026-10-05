class Player
  attr_accessor :name, :choice

  def initialize(name)
    @name = name
    @choice = nil
  end

  def set_choice
    puts "Enter your guess (4 numbers, 1 through 6):"
    @choice = gets.chomp.to_i
  end
end