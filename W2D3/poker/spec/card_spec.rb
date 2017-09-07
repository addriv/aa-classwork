require 'card'

describe Card do
  subject(:card) { Card.new("10", "club")}

  it "initializes the card type" do
    expect(card.type).to eq("10")
  end

  it "assigns a suit" do
    expect(card.suit).to eq("club")
  end
  
end
