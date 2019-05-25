require 'ruby_rubik/cube_permutation'

class RubyRubik

  IDENTITY = CubePermutation::IDENTITY

  # Corners are listed always in clockwise order

  F = CubePermutation.new(
  'uf' => 'rf',
  'lf' => 'uf',
  'df' => 'lf',
  'rf' => 'df',

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

  R = CubePermutation.new(
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



end
