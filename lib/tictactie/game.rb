module TicTacTie
  class Game
    attr_reader :player1, :player2, :symbol
    def initialize
      @board = Board.new
      @player1 = Player.new("X")
      @player2 = Player.new("O")
      @current_turn = 1
      puts @board
      turn
      win_message
      tie_message
      play_again
    end

    def move(player)
      while !@board.winning_scenarios && !@board.tie
        puts "Where would you like to move 'player #{player.symbol}'?".red
        choice = gets.chomp.to_i

        if @board.free_at?(choice)
          @board.place_symbol(choice, player.symbol)
          @current_turn += 1
        else
          puts "Space unavailable! Please select another cell"
        end

        puts "Player #{player.symbol}'s move:".green
        puts @board
        turn
      end
    end

    def tie_message
      puts "It's a Draw!".cyan if @board.tie
    end

    def win_message
      puts "Game over!".cyan if @board.winning_scenarios
    end

    def turn
      @current_turn.even? ? move(@player2) : move(@player1)
    end

    def play_again
      puts "Play again? (yes or no)".yellow
      answer = gets.chomp.downcase
      if answer == "yes"
        self.class.new
      else
        puts "Goodbye".cyan.bold
      end
    end
  end
end
