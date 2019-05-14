class Permutation

  def initialize(changes)
    # Permutations are given in form:
    #     :a => :b,
    #     :b => :c,
    #     :c => :a
    # which means: element :a transforms in element :b

    @changes = changes

    # A permutation must be a biyective function
    # We know it's a function because we can't have duplicate indexes in changes hash,
    # so it will be only one image per origin
    # But we must check for biyective conditions
    check_biyective
  end

  def apply_to(set)
    set.map {|element| apply_permutation(element)}
  end

  # Pipelining (beware: not composition!) of permutations
  # This permutation will be applied FIRST
  def *(permutation)

    # To pipe two permutations, we must apply the second permutation
    # to the results of first pemutation:
    #
    # p1:
    #   a => b
    #   b => c
    #   c => a
    #
    # p2:
    #   a => c
    #   c => a
    #   j => k
    #   k => j
    #
    # The result permutation p1*p2 will be:
    #   a	=> b
    #   b	=> c => a
    #   c	=> a => c
    #        j => k
    #        k => j
    #
    # That is:
    #   a => b
    #   b => a
    #   c => c (this pair will be ommited)
    #   j => k
    #   k => j

    origins = @changes.keys
    images = @changes.values

    # First, we apply the new permutation to the images of this permutation
    images = permutation.apply_to(images)
    # puts "After aplying the second permutation:"
    # p Hash[origins.zip(images)]

    # Second, we remove the already applied items for the second pemutation
    # Beware: we must compare with the original images
    remaining = permutation.changes.reject { |key, elem| @changes.values.include? key }

    # Third, we add the second permutation remaining changes to the list of changes
    origins += remaining.keys
    images += remaining.values

    # Then we put it togheter
    new_changes = Hash[origins.zip(images)]

    # Finally we remove identities (elements which change to themselves)
    new_changes.reject! { |k,e| k == e}

    # Et voila! Here is the new permutation
    Permutation.new(new_changes)
  end

  # Inverse permutation
  def !
    Permutation.new @changes.invert
  end

  def cycles
    # TODO: refactor this, is uninteligible
    permutations = @changes
    the_cycles = []
    while permutations.length > 0
      cycle = []
      origin = permutations.keys[0]
      until cycle.include?(origin)
        cycle << origin
        destination = permutations[origin]
        permutations.delete origin
        origin = destination
      end
      the_cycles << cycle
    end

    the_cycles
  end

  def changes
    @changes
  end

  def to_s
    @changes.to_s
  end

  def eql?(permutation)
    @changes == permutation.changes
  end

private


  def apply_permutation(element)
    @changes[element] || element
  end

  def check_biyective
    # A biyective function is a inyective and surjective function
    check_inyective
    check_surjective
  end

  def check_inyective
    # injective: F(x)=F(y)⟹x=y
    # ------------------------------------------------------------

    # We must check that all right elements are on the left, or it won't be inyective
    # For example, if we had permutation { a => b }
    # F(a)=b but F(b)=b too (it's not listed on the permutation so it has itself as image)
    # If we apply that permutation to [a,b] it will result in [b.b]
    # It wouldn't be an inyective function
    check_right_elements_on_left

    # We must check that there aren't two elements with the same image in the list
    # or permutations like {a=>b, b=>b} would be valid
    #
    # Note that, if we check for surjectivity, this check is redundant: we have
    # the same elements on the left and on the right, and the elements on
    # the left aren't duplicated (it's a hash) so it's impossible to have
    # duplicate elements on the right.
    #
    # But it will be a more meaningful error for the user to say that there are duplicates on the right
    check_no_duplicates_on_right
  end

  def check_surjective
    # surjective: for all b∈B there is some a∈A such that F(a)=b.
    # ------------------------------------------------------------
    # If an element is not present in @changes hash, it remains unchanged.
    # So all elements on the left side must be on the right side, or the element missing
    # won't have an image.
    #
    # For example, if we have permutation {a=>b} then there is no element with "a" as image
    check_left_elements_on_right
  end


  def check_right_elements_on_left
    origins = @changes.keys

    @changes.values.each do |destination|
      unless origins.include? destination
        raise "Permutation must be inyective. Element '#{destination}' should be listed as an element to change (#{destination} => something)"
      end
    end
  end

  def check_left_elements_on_right
    images = @changes.values

    @changes.keys.each do |origin|
      unless images.include? origin
        raise "Permutation must be suryective. Element '#{origin}' should be an image of another element (something => #{origin})"
      end
    end
  end

  def has_duplicates?(array)
    array.uniq.length != array.length
  end

  def get_duplicates(array)
    array.select{|element| array.count(element) > 1 }.uniq
  end

  def check_no_duplicates_on_right
    right_elements = @changes.values

    if has_duplicates?(right_elements)
      dups = get_duplicates(right_elements)
      raise "Permutation must be inyective. Element(s) #{dups} appears more than one time as images."
    end
  end


public

  IDENTITY = Permutation.new({})

end