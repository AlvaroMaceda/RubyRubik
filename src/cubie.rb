require_relative 'rotation_of'

class Cubie

  attr_reader :position

  def initialize(position)
    @position = position.to_s
  end

  def == (cubie)
    return false unless cubie.kind_of? Cubie

    cubie.position.rotation_of? position
  end
  alias_method :eql?, :==

  def same?(cubie)
    cubie.position == position
  end

  def permute(permutation)
    return self unless permutation.key? self

    # We must find the Cubie which serve as key for this cubie
    # It can be a rotation of this cubie
    from_element = get_real_key(permutation,self)
    to_element = permutation[self]

    # Applying ufl=>rfu to luf
    # It gives now: rfu
    # It must give: urf

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

  private

  def get_real_key(hash,key)
    hash.keys[hash.keys.index(key)]
  end

end
