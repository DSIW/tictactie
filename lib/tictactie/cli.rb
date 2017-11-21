module TicTacTie
  class Cli
    def self.ask(message)
      puts message
      gets.chomp
    end

    def self.play_again?
      ask("Play again? (yes or no)".yellow) =~ /^y/i
    end
  end
end
