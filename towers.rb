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
    @rod_one = []
    @rod_two = []
    @rod_three = []
  end

  def reset_board
    @rod_one = []
    @rod_two = []
    @rod_three = []

    i = @disks

    @disks.times do
      @rod_one.push(i)
      i -= 1
    end
  end

  def instructions
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."
  end

  def render
    puts @rod_one
    puts @rod_two
    puts @rod_three
  end

  def new_game
    reset_board
    instructions
    render
  end

  def user_move
    print "Enter move > "
    entry = gets
    quit?(entry)
    valid_move?(entry) ? move_disk(entry) : invalid_entry
  end

  def quit?(entry)
    entry == "q"
  end

  def valid_move?(entry)

  end

  def invalid_entry
    puts "Please enter a valid input."
  end

  def move_disk(entry)

  end

  def won?

  end

  def play_again?
    puts "Would you like to play again?"
    puts "Enter 'y' to play again or 'q' to quit."
    entry = gets

    if entry == "q"
      exit
    elsif entry == "y"
      play
    else
      invalid_entry
      play_again?
    end
  end

  def game_over

  end

  def play

  end

end


