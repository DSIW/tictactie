#!/usr/bin/env ruby
# encoding: utf-8

module TicTacTie
  class Player
    attr_accessor :symbol
    def initialize(symbol)
      @symbol = symbol
    end
  end
end
