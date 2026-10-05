class Game
  def initialize
    @player = Player.new("Player 1")
    @computer = Computer.new
    @board = Board.new
  end
  
  def play
    @computer.generate_secret_code
    @player.set_choice

    if @player.choice == @computer.code
      puts "You win!"
    elsif @player.choice != @computer.code
      puts "You lose!"
    end
  end

  def key_peg
    if @player.choice.each_with_index { |num, index| num == @computer.code[index] }
      puts "Key Peg: 4"
    elsif @player.choice.any? { |num| @computer.code.include?(num) }
      puts "Key Peg: 1"
    else
      puts "Key Peg: 0"
    end
  end

end