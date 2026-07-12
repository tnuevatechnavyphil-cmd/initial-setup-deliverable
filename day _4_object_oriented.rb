class Game
  attr_accessor :game_board, :current_player, :is_game_over, :winner
  
  @@game_count = 0
  def self.game_count
    @@game_count
  end

  def initialize()
    @@game_count += 1

    @is_game_over = false
    @current_player = "X"
    @game_board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil],
    ]
  end

  def user_moves()
    while true
      print "Enter a number from 1-9: "
      input_move = gets.chomp().to_i

      # Check if user move is out of bounds
      if (1 > input_move or input_move > 9)
        puts "Enter a number from 1 - 9 only!"
        next
      end

      # Sets the move
      input_move -= 1
      row = input_move / 3
      column = input_move % 3
      
      # Check if there is a pre-existing moove
      if @game_board[row][column]
        puts "There is already a move there!"
        next
      end

      break
    end

    @game_board[row][column] = @current_player
  end

  def print_board()
    for row in @game_board
      for cell in row
        if cell
          print "| #{cell} |"
        else
          print "|   |"
        end
      end
      puts
    end
  end

  def check_winner()
    # Check horizontal
    for board in @game_board
      if board[0] == board[1] && board[1] == board[2] && board[0]
        @is_game_over = true
        @winner = @current_player
      end
    end

    # Check vertical
    for column_index in 0..2
      if @game_board[0][column_index] == @game_board[1][column_index] && @game_board[1][column_index] == @game_board[2][column_index] && @game_board[0][column_index]
        @is_game_over = true
        @winner = @current_player
      end
    end

    # Check diagonal
    if @game_board[0][0] == @game_board[1][1] && @game_board[1][1] == @game_board[2][2] && @game_board[0][0]
        @is_game_over = true
        @winner = @current_player
    end
  
    if @game_board[0][2] == @game_board[1][1] && @game_board[1][1] == @game_board[2][0] && @game_board[0][2]
        @is_game_over = true
        @winner = @current_player
    end

    # Check Tie
    if @game_board[0].none?(&:nil?) and @game_board[1].none?(&:nil?) and @game_board[2].none?(&:nil?)
      @is_game_over = true
      @winner = "tie"
    end
  end

  def switch_player()
    if @current_player == "X"
      @current_player = "O"
    else
      @current_player = "X"
    end
  end
end

print "How many games do you want? "
game_count = gets.chomp().to_i
game_list = []


for _ in 0...game_count
  game = Game.new()
  
  while !game.is_game_over
    game.user_moves()
    game.print_board()
    game.check_winner()
    game.switch_player()
  end
  
  if game.winner != "tie"
    puts "Game ##{Game.game_count}: #{game.winner} is the winner"
  else
    puts "Game: ##{Game.game_count}: It's a tie"
  end

  game_list << game
end

results = game_list.map.with_index do |x, index|
  "Game #{index+1}: #{x.winner}"
end

for i in results
  puts i
end