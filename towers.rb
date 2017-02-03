class TowerOfHanoi
  # Display instructions to user
  # Set up game board
  # Stack N disks on first rod with largest on bottom
  # Rod two and three start out with no disks
  # Render game board
  # Until user quits or wins:
  # Request move from user
  # If input is 'quit', end the game
  # If input is valid move
  # Update game board
  # Render game board
  # If user won, output congratulations message
  # If input is invalid, ask user to reenter

  def initialize(disks = 3)
    @disks = disks
    @tower_one = []
    @tower_two = []
    @tower_three = []
  end

  def instructions
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."
  end

  def play

  end

  def new_game

  end

  def set_board

  end

  def render

  end

  def won?

  end

  def game_over

  end

  def valid_move?

  end

  def move_disk(a, b)

  end

end

