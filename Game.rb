require './Player'
require './Computer'

class Game
  

  def initialize
    @player = Player.new("Player 1")
    @computer = Computer.new
    @board = ["X", "X", "X", "X"]
    @round = 1
  end
  
  def play
    @computer.generate_secret_code
    puts "Welcome to Mastermind!"
    while @player.choice != @computer.code && @round < 13
      puts "Round #{@round}:"

      @player.set_choice

      display_board

      puts "Player's choice: #{@player.choice}"
      @round += 1
      if @round > 12
      puts "Game Over! You've used all your attempts."
      end
    end    

  end

  def result
        
  end  

  def display_board
    puts "Board"
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

Game.new.play