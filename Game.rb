require './Player'
require './Computer'
require 'colorize'

class Game

  def initialize
    @player = Player.new("Player 1")
    @computer = Computer.new
    @round = 1
  end
  
  def play
    puts "Welcome to Mastermind!"
    puts "\n"
    @computer.generate_secret_code
    puts @computer.code
    puts "\n"
    while @player.choice != @computer.code && @round < 13
      puts "Round #{@round}:"

      @player.set_choice

      puts "Player's choice: #{@player.choice}"

      if @player.choice == @computer.code
        puts "Congratulations! You've guessed the secret code!"
        break
      end
      key_peg
      @round += 1
      if @round > 12
        puts "Game Over! You've used all your attempts."
        puts "The secret code was: #{@computer.code}"
      end
    end    

  end


  def result(choice, code)
    exact_matches = 0
    code_counts = Hash.new(0)
    choice_counts = Hash.new(0)

    choice.each_with_index do |num, index|
      if num == code[index]
        exact_matches += 1
      else
        code_counts[code[index]] += 1
        choice_counts[num] += 1
      end
    end

    number_matches = 0
    choice_counts.each do |num, count|
      if code_counts.key?(num)
        number_matches += [count, code_counts[num]].min
      end
    end
    {exact: exact_matches, number: number_matches}
  end  

  def key_peg
    puts "Key Peg"
    puts "---------------------------------"
    puts "Exact matches: #{result(@player.choice, @computer.code)[:exact]}"
    puts "Number matches: #{result(@player.choice, @computer.code)[:number]}"    
  end
end

Game.new.play