require_relative '../../game'

RSpec.describe Game do
  it 'has player cards as empty array' do
    expect(subject.player_cards).to eq([])
  end

  let(:deck){ double(Deck) }
  let(:card){ double(Card) }

  it 'has player cards' do
    allow(:deck).receive('value').with(11)


  end
end