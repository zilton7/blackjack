require_relative '../../deck'

RSpec.describe Deck do
  it 'has 52 cards' do
    expect(subject.cards.size).to eq(52)
  end

  it 'has 4 ranks' do
    RANKS = %w{ hearts diamonds clubs spades }
    @cards = subject.cards

    RANKS.each do |rank|
      expect(@cards.find { |card| card.suit == rank }).to_not be_nil, "suit '#{rank}' not found in the deck"
    end
  end
end