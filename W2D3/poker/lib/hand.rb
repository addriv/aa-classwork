class Hand

  attr_reader :draw

  def initialize(draw)
    @draw = draw
    @score = score
  end

  def score

  end

  def royal_flush?
    types.sort == (10..14).to_a && flush?
  end

  def four_of_a_kind?
    types.each { |type| return true if type.count == 4 }
    false
  end

  def two_pair?
    types.each do |type1|
      if types.count(type1) == 2
        types.delete(type1)
        types.each do |type2|
          return true if type.count(type2) == 2
        end
      end
    end
    false
  end

  def one_pair?
    types.each { |type| return true if type.count == 2 }
    false
  end

  def flush?
    suit.all? { |icon| icon == suit.first }
  end

  def types
    @draw.map { |card| card.type }
  end

  def suit
    @draw.map { |card| card.suit }
  end

end
