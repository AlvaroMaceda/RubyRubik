class Cycles

  class << self

    def same?(cycle1, cycle2)
      cycle1 = cycle1.clone
      cycle2 = cycle2.clone

      until cycle1.empty?
        checking = cycle1.shift
        index_of_element = search_element_rotated(cycle2,checking)
        return false unless index_of_element

        cycle2.delete_at index_of_element
      end

      cycle2.empty?
    end

    private

    def to_cycle(thing)
      return thing if thing.kind_of?(self.class.name)

      self.class.new(thing)
    end

    def search_element_rotated(array,search)
      array.index { |element| search.rotation_of?(element) }
    end

  end

  def initialize(cycles=nil)
    @cycles = cycles
  end

end
