class Cubie

  attr_reader :position

  def initialize(position)
    @position = position
  end

  def same? cubie
    self.canonical_form == cubie.canonical_form
  end

  protected

  def canonical_form
    @position.chars.sort.join
  end

end
