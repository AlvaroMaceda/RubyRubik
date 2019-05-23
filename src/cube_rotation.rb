require_relative './permutation.rb'
require_relative './cubie.rb'

class CubeRotation < Permutation

  private

  def initialize(changes)
    super changes.map { |from,to| [Cubie.new(from), Cubie.new(to)] }.to_h
  end

  public

  def image_of(element)
    element.permute(@changes)
  end

  IDENTITY = CubeRotation.new({})

  # Corners are listed always in clockwise order

  F = CubeRotation.new(
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

  # R = CubeRotation.new(
  #   'ur' => 'br',
  #   'fr' => 'ur',
  #   'dr' => 'fr',
  #   'br' => 'dr',
  #
  #   'urf' => 'bru',
  #   'ubr' => 'bdr',
  #   'bdr' => 'dfr',
  #   'rdf' => 'rfu'
  # )

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

  def changes
    @changes.map { |from,to| [from.to_s, to.to_s] }.to_h
  end


end
