class TowerOfHanoi
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
    puts "Enter move: "
    entry = gets.chomp()

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
    from = entry[0]
    to = entry[2]

    return false unless /[1-3,1-3]/.match(entry)
    return false if from == to
    return false if @rods[from][-1] == 0
    return false if (@rods[to][-1] < @rods[from][-1]) && @rods[to][-1] != 0

    true
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

    if entry == "q"
      return false
    elsif entry == "y"
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
