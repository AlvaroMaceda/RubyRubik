class Cubie

  attr_reader :position

  def initialize(position)
    @position = position
  end

  def same?(cubie)
    self.canonical_form == cubie.canonical_form
  end

  def == cubie
    self.canonical_form == cubie.canonical_form
  end

  def eql?(cubie)
    self == cubie
  end

  def to_s
    @position
  end

  protected

  def canonical_form
    @position.chars.sort.join
  end

end
