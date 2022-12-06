require_relative '../../card'

RSpec.describe Card do
  subject { Card.new('hearts', 'ace', 11, '♡') }

  it 'has a suit' do
    expect(subject.suit).to eq('hearts')
  end

  it 'has a rank' do
    expect(subject.rank).to eq('ace')
  end

  it 'has a value' do
    expect(subject.value).to eq(11)
  end

  it 'has a value' do
    expect(subject.symbol).to eq('♡')
  end
end