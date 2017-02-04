class TowerOfHanoi
  def initialize(disks = 3)
    @disks = disks
    @rods = [[], [], []]
  end

  def reset_board
    @rods[0] = []
    @rods[1] = []
    @rods[2] = []

    @disks.downto(1) do |i|
      @rods[0].push(i)
    end
  end

  def instructions
    puts "\nWelcome to Tower of Hanoi!\n\n"
    puts "Instructions:\n\n"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."
  end

  def new_game
    reset_board
    instructions
    render
  end

  def user_move
    print "Enter move: "
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
    from = entry[0].to_i - 1
    to = entry[2].to_i - 1

    return false unless /[1-3,1-3]/.match(entry)
    return false if from == to
    return false if @rods[from] == []

    if @rods[to] != []
      return false if @rods[to][-1] < @rods[from][-1]
    end

    true
  end

  def invalid_entry
    puts "Please enter a valid input."
  end

  def move_disk(entry)
    from = entry[0].to_i - 1
    to = entry[2].to_i - 1

    disk = @rods[from].pop()
    @rods[to].push(disk)
  end

  def win?
    winning_sequence = []

    @disks.downto(1) do |i|
      winning_sequence.push(i)
    end

    @rods[1] == winning_sequence || @rods[2] == winning_sequence ? true : false
  end

  def play_again?
    puts "Congratulations! Would you like to play again?"
    puts "Enter 'y' to play again or 'q' to quit."
    entry = gets.chomp()

    if entry == "q"
      return false
    elsif entry == "y"
      return true
    else
      invalid_entry
      play_again?
    end
  end

  def play
    new_game

    until win?
      user_move
      render
    end

    play_again? ? play : exit
  end

  #### Render methods

  def render_margin(margin)
    print " " * margin
  end

  def render_base(line_width, margin)
    dash_padding = (line_width - 3) / 2
    board_length = line_width * 3 + margin * 2

    puts "-" * board_length

    1.upto(3) do |i|
      print "-" * dash_padding
      print " #{i} "
      print "-" * dash_padding
      print " " * margin unless i == 3
      puts if i == 3
    end

    puts "-" * board_length
    puts
  end

  def render_disk(line_width, disk_width)
    padding = (line_width - disk_width) / 2
    print " " * padding
    disk_width == 0 ? print(" ") : print("0" * disk_width)
    print " " * padding
  end

  def render
    line_width = 7 + (@disks - 3) * 2
    margin = 3

    @disks.downto(0) do |row|
      3.times do |rod|
        if @rods[rod][row]
          disk_width = 1 + (@rods[rod][row] - 1) * 2
        else
          disk_width = 0
        end

        render_disk(line_width, disk_width)
        render_margin(margin)
        puts if rod == 2
      end
    end

    render_base(line_width, margin)
  end

end

t = TowerOfHanoi.new(3)
t.play
