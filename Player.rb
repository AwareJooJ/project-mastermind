class Player
  attr_accessor :name, :choice

  def initialize(name)
    @name = name
    @choice = nil
  end

  def set_choice
    puts "Enter your guess (4 numbers, 1 through 6):"
    @choice = gets.chomp.split("").map(&:to_i)
    until valid_choice?(@choice)
      puts "Invalid choice. Please enter 4 numbers, each between 1 and 6:"
      @choice = gets.chomp.split("").map(&:to_i)
    end
  end

  def valid_choice?(choice)
    choice.length == 4 && choice.all? { |num| num.between?(1, 6) }
  end
end