require_relative '../../deck'

RSpec.describe Deck do
  context 'Entire deck' do
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


  context 'single card in deck' do
    let(:card) { subject.cards.find{ |card| card.suit == 'hearts' && card.rank == 'A' } }

    it 'has Integer as a value' do
      expect(card.value).to be_a(Integer)
    end

    it 'has other attributes as Strings' do
      expect(card.suit).to be_a(String)
      expect(card.rank).to be_a(String)
      expect(card.symbol).to be_a(String)
    end

    it 'has correct attributes' do    
      expect(card.suit).to eq('hearts')
      expect(card.rank).to eq('A')
      expect(card.value).to eq(11)
      expect(card.symbol).to eq('♡')
    end
  end

  it 'picks card' do
    card = subject.pick

    expect(subject.cards.size).to eq(51)
  end
end