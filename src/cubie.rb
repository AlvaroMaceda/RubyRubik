class Cubie

  attr_reader :position

  def initialize(position)
    @position = position.to_s
  end

  def == cubie
    self.canonical_form == cubie.canonical_form
  end

  def same?(cubie)
    self == cubie
  end

  def eql?(cubie)
    self == cubie
  end

  def to_s
    @position
  end

  def hash
    self.canonical_form.hash
  end

  protected

  def canonical_form
    @position.chars.sort.join
  end

end
