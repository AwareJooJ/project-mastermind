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
    while @player.choice != @computer.code && @round < 13
      puts "---------------------------------"
      puts "Round #{@round}:"

      @player.set_choice
      puts "\n"
      puts "Player's choice: #{colorize_numbers(@player.choice)}"

      if @player.choice == @computer.code
        puts "Congratulations! You've guessed the secret code!"
        break
      end
      key_peg
      @round += 1
      if @round > 12
        puts "Game Over! You've used all your attempts."
        puts "The secret code was: #{colorize_numbers(@computer.code)}"
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
    puts "Exact matches: #{result(@player.choice, @computer.code)[:exact].to_s.colorize(:red)}"
    puts "Number matches: #{result(@player.choice, @computer.code)[:number].to_s.colorize(:gray)}"    
  end

  def colorize_numbers(numbers)
    numbers.map do |num|
      case num
      when 1
        num.to_s.colorize(:color => :red, :mode => :bold)
      when 2
        num.to_s.colorize(:color => :green, :mode => :bold)
      when 3
        num.to_s.colorize(:color => :blue, :mode => :bold)
      when 4
        num.to_s.colorize(:color => :yellow, :mode => :bold)
      when 5
        num.to_s.colorize(:color => :magenta, :mode => :bold)
      when 6
        num.to_s.colorize(:color => :cyan, :mode => :bold)
      else
        num.to_s
      end
    end.join(" ")
  end

end

Game.new.play