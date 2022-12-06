require_relative 'card'

class Deck
  attr_reader :cards

  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
  VALUE = %w{ 2 3 4 5 6 7 8 9 10 10 10 10 11 }
  SUITS = %w{ hearts diamonds clubs spades }
  SYMBOLS = %w{ ♡ ♢ ♣ ♠ }

  def initialize
    @cards = []
    RANKS.each.with_index do |rank, i|
      SUITS.each do |suit|
        @cards << Card.new(suit, rank, SUITS[i], SYMBOLS[i])
      end
    end
  end
end