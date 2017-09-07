require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a new empty deck as an array" do
      expect(deck.card_deck).to be_a(Array)
    end

    it "populates the deck 52 cards" do
      expect(deck.card_deck.length).to eq(52)
    end

    it "is the deck all cards" do
      expect(deck.card_deck.all? { |el| el.is_a?(Card) } ).to be true
    end

    it "shuffles the deck" do
      card_values = Array.new( )
      deck.card_deck.each do |card|
        card_values << card.type
      end
      expect(card_values.uniq).not_to eq( (2..14).to_a )
    end

  end
end
