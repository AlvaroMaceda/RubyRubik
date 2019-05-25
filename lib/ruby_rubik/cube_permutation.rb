require 'ruby_rubik/permutation'
require 'ruby_rubik/cubie'

class CubePermutation < Permutation

  IDENTITY = CubePermutation.new({})

  def initialize(changes)
    super changes.map { |from,to| [Cubie.new(from), Cubie.new(to)] }.to_h
  end

  def image_of(element)
    element.permute(@changes)
  end

  def changes
    @changes.map { |from,to| [from.to_s, to.to_s] }.to_h
  end

  def to_s
    changes.to_s
  end

  def cycles
    cycles_elements_to_string super
  end

  def cycle_from(element)
    cycle = []
    until cycle.include? element
      cycle << element
      element = image_of(element)
    end
    cycle
  end

  private

  def cycles_elements_to_string(cycles)
    cycles.map do |cycle|
      cycle.map {|cubie| cubie.to_s}
    end
  end

end