require "tictactie/version"
require "tictactie/player"
require "tictactie/board"
require 'colored'

module TicTacTie
  class Game < Board
    attr_reader :player1, :player2, :symbol
    def initialize
      super
      play_game
    end

    def play_game
      @player1 = Player.new("X")
      @player2 = Player.new("O")
      puts Board.new
      @current_turn = 1
      turn
      win_message
      tie_message
      play_again
    end

    def move(player)
      while !winning_scenarios && !tie
        puts "Where would you like to move 'player #{player.symbol}'?".red
        choice = gets.chomp.to_i
        check_space(choice, player.symbol)
        puts "Player #{player.symbol}'s move:".green
        puts self
        turn
      end
    end

    def tie_message
      puts "It's a Draw!".cyan if tie
    end

    def win_message
      puts "Game over!".cyan if winning_scenarios
    end

    def turn
      @current_turn.even? ? move(@player2) : move(@player1)
    end

    def play_again
      puts "Play again? (yes or no)".yellow
      answer = gets.chomp.downcase
      if answer == "yes"
        TicTacToe::Game.new
      else
        puts "Goodbye".cyan.bold
      end
    end
  end
end
