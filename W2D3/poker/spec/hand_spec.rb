require 'hand'
require 'card'

describe Hand do
  subject(:hand) { Hand.new( [
    Card.new(14,"♠"),
    Card.new(13,"♠"),
    Card.new(12,"♠"),
    Card.new(11,"♠"),
    Card.new(10,"♠")
  ] ) }

  context '#initialize' do
    it "draws 5 cards from the shuffled deck" do
      expect(hand.draw.length).to eq(5)
      expect(hand.draw.all? {|el| el.is_a?(Card) } ).to be true
    end
  end

  it 'ranks the hand' do
    expect(hand.royal_flush?).to eq(true)
  end
end
