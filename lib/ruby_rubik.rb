require 'ruby_rubik/permutation'
require 'ruby_rubik/cubie'

class RubyRubik < Permutation

  private

  def initialize(changes)
    super changes.map { |from,to| [Cubie.new(from), Cubie.new(to)] }.to_h
  end

  public

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

  IDENTITY = RubyRubik.new({})

  # Corners are listed always in clockwise order

  F = RubyRubik.new(
  'uf' => 'rf',
  'lf' => 'uf',
  'bf' => 'lf',
  'rf' => 'bf',

  'ufl' => 'rfu',
  'urf' => 'rdf',
  'rdf' => 'dlf',
  'dlf' => 'luf'
  )

  # U = CubeRotation.new(
  #   'uf' => 'ul',
  #   'ul' => 'ub',
  #   'ub' => 'ur',
  #   'ur' => 'uf',
  #
  #   'ufl' => 'ulb',
  #   'ulb' => 'ubr',
  #   'ubr' => 'ufr',
  #   'ufr' => 'urf'
  # )

  R = RubyRubik.new(
  'ur' => 'br',
    'fr' => 'ur',
    'dr' => 'fr',
    'br' => 'dr',

    'urf' => 'bru',
    'ubr' => 'bdr',
    'bdr' => 'dfr',
    'rdf' => 'rfu'
  )

  # x = CubeRotation.new(
  #   '' => '',
  #   '' => '',
  #   '' => '',
  #   '' => '',
  #
  #   '' => '',
  #   '' => '',
  #   '' => '',
  #   '' => ''
  # )

  private

  def cycles_elements_to_string(cycles)
    cycles.map do |cycle|
      cycle.map {|cubie| cubie.to_s}
    end
  end

end
