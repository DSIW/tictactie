#!/usr/bin/env ruby
# encoding: utf-8

module TicTacTie
  class CliGame < Game
    def initialize
      super
    end

    def self.play_endless
      begin
        begin
          self.new.play
        end while play_again?
      rescue Interrupt => e
        # do nothing
      ensure
        puts "Goodbye".cyan.bold
      end
    end

    def self.ask(message)
      puts message
      gets.chomp
    end

    def print_board
      puts "Player #{current_player}'s move:".green
      puts @board
    end

    def print_status
      puts status.cyan
    end

    def print_unavailable_space
      puts "Space unavailable! Please select another cell"
    end

    private

    def self.play_again?
      ask("Play again? (yes or no)".yellow) =~ /^y/i
    end
  end
end
