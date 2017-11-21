#!/usr/bin/env ruby
# encoding: utf-8

module TicTacTie
  class Board
    WINNING_COMBOS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    def initialize
      @spaces = Array.new(9)
    end

    def to_s
      output = ""
      0.upto(8) do |position|
        output << "#{@spaces[position] || position}"
        case position % 3
        when 0, 1 then output << " | "
        when 2 then output << "\n-----------\n" unless position == 8
        end
      end
      output + "\n"
    end

    def free_at?(cell)
      @spaces[cell].nil?
    end

    def place_symbol(cell, sym)
      @spaces[cell] = sym
    end

    def done?
      player_won? || full?
    end

    def player_won?
      WINNING_COMBOS.any? do |set|
        if @spaces[set[0]] == @spaces[set[1]] && @spaces[set[1]] == @spaces[set[2]]
          @spaces[set[0]]
        end
      end
    end

    def full?
      !@spaces.include?(nil)
    end
  end
end
