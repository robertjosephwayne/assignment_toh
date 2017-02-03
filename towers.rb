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
    @rods = {"1" => [], "2" => [], "3" => []}
  end

  def reset_board
    @rods["1"] = [0]
    @rods["2"] = [0]
    @rods["3"] = [0]

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
    p @rods["1"]
    p @rods["2"]
    p @rods["3"]
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
    else
      invalid_entry
      user_move
    end
  end

  def quit?(entry)
    entry == "q"
  end

  def valid_move?(entry)
    unless /[1-3,1-3]/.match(entry)
      return false
    end

    from = entry[0]
    to = entry[2]

    if @rods[from][-1] == 0
      puts "No disk in from rod (Rod #{from})"
      return false
    elsif (@rods[to][-1] < @rods[from][-1]) && @rods[to][-1] != 0
      puts "Cannot place larger disk on top of smaller disk (from #{from} to #{to})"
      return false
    else
      return true
    end
  end

  def invalid_entry
    puts "Please enter a valid input."
  end

  def move_disk(entry)
    from = entry[0]
    to = entry[2]

    disk = @rods[from].pop()
    @rods[to].push(disk)
  end

  def win?
    winning_sequence = [0]

    i = @disks
    @disks.times do
      winning_sequence.push(i)
      i -= 1
    end

    @rods["2"] == winning_sequence || @rods["3"] == winning_sequence ? true : false
  end

  def play_again?
    puts "Would you like to play again?"
    puts "Enter 'y' to play again or 'q' to quit."
    entry = gets

    if entry.chomp() == "q"
      return false
    elsif entry.chomp() == "y"
      return true
    else
      invalid_entry
      play_again?
    end
  end

  def game_over

  end

  def play
    new_game

    until win?
      user_move
      render
    end

    play if play_again? else exit
  end

end


