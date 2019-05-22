require_relative 'rotation_of'

class Cubie

  attr_reader :position

  def initialize(position)
    @position = position.to_s
  end

  def ==(cubie)
    # self.canonical_form == cubie.canonical_form
    cubie.position.rotation_of? position
  end

  alias_method :same?, :==
  alias_method :eql?, :==

  def permute(permutation)
    to_element = permutation[self]
    return self unless to_element

    to_element
  end

  def to_s
    @position.to_s
  end

  def hash
    self.canonical_form.hash
  end

  protected

  def canonical_form
    @position.chars.sort.join
  end

end
