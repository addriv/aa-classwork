require_relative 'card'

class Deck
  attr_accessor :card_deck

  def initialize
    @card_deck = Array.new
    populate
    @card_deck = @card_deck.shuffle
  end

  def populate
    values = (2..14).to_a
    suits = %w(♠ ♥ ♦ ♣)

    values.each do |val|
      suits.each { |suit| @card_deck << Card.new(val, suit) }
    end
  end

end
