class Computer
  attr_accessor :code

  def initialize
    @code = []
  end

  def generate_secret_code
    4.times do
      @code << rand(1..6)
    end
    puts "Computer has generated a secret code."
  end
end