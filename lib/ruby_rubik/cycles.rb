# frozen_string_literal: true


class Cycle

  class << self

    def from_element(element, permutation)
      cycle = self.new
      until cycle.include? element
        cycle << element
        element = permutation.image_of(element)
      end
      cycle
    end

  end

  def initialize
    @elements = []
  end

  def include?(element)
    @elements.include? element
  end

  def <<(element)
    raise 'Duplicated element' if include? element

    @elements << element
  end


end


class Cycles

  class << self

    def from_permutation(permutation)
      remaining_changes = permutation.to_h

      calculated_cycles = []
      until remaining_changes.empty?
        cycle_elements = cycle_from(remaining_changes.keys.first,permutation)
        calculated_cycles << cycle_elements
        remaining_changes.delete_if { |key, _| cycle_elements.include? key }
      end

      new(calculated_cycles)
    end

    def same?(cycles1, cycles2)
      cycles1 = cycles1.to_a
      cycles2 = cycles2.to_a

      until cycles1.empty?
        checking = cycles1.shift
        index_of_element = search_element_rotated(cycles2,checking)
        return false unless index_of_element

        cycles2.delete_at index_of_element
      end

      cycles2.empty?
    end

    private

    def cycle_from(element,permutation)
      cycle = []
      until cycle.include? element
        cycle << element
        element = permutation.image_of(element)
      end
      cycle
    end

    def to_cycle(thing)
      return thing if thing.kind_of?(self.class.name)

      self.class.new(thing)
    end

    def search_element_rotated(array,search)
      array.index { |element| search.rotation_of?(element) }
    end

  end

  def initialize(cycles=nil)
    raise 'Must be initialized with an array of cycles' unless cycles.kind_of?(Array) or cycles.nil?
    
    @cycles = cycles
  end

  def same?(cycle)
    self.class.same? self,cycle
  end

  def to_a
    @cycles.to_a
  end
  
end
