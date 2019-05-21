require_relative './permutation.rb'
require_relative './cubie.rb'

class CubeRotation < Permutation

  protected_methods :new

  private

  def initialize(changes)
    super changes.map { |from,to| [Cubie.new(from), Cubie.new(to)] }.to_h
  end

  public

  F = CubeRotation.new(
    'uf' => 'rf',
    'lf' => 'uf',
    'bf' => 'lf',
    'rf' => 'bf',

    'ufl' => 'rfu',
    'ufr' => 'rfd',
    'dfr' => 'lfd',
    'dfl' => 'lfu'
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
    @changes.map { |from,to| [from, to] }.to_h
  end


end
