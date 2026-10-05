class Board
  def initialize
    @board = []
    @secret_code = computer.generate_secret_code
  end
end