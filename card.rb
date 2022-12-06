class Card
  attr_reader :suit, :rank, :value, :symbol

  def initialize(suit, rank, value, symbol)
    @suit = suit
    @rank = rank
    @value = value
    @symbol = symbol
  end
end