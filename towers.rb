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
    @rods = { "1" => [], "2" => [], "3" => [] }
  end

  def reset_board
    @rods["1"] = []
    @rods["2"] = []
    @rods["3"] = []

    i = @disks

    @disks.times do
      @rods["1"].push(i)
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
    puts @rods["1"]
    puts @rods["2"]
    puts @rods["3"]
  end

  def new_game
    reset_board
    instructions
    render
  end

  def user_move
    print "Enter move > "
    entry = gets

    if quit?(entry)
      exit
    elsif valid_move?(entry)
      move_disk(entry)
      game_over if win?
    else
      invalid_entry
    end
  end

  def quit?(entry)
    entry == "q"
  end

  def valid_move?(entry)
    puts /[1-3,1-3]/.match(entry)

    from = entry[0].to_i
    to = entry[2].to_i
  end

  def invalid_entry
    puts "Please enter a valid input."
  end

  def move_disk(from, to)

  end

  def win?

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


