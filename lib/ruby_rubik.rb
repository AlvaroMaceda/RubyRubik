require 'ruby_rubik/cube_rotation'

class RubyRubik

  IDENTITY = CubeRotation::IDENTITY

  # Corners are listed always in clockwise order

  F = CubeRotation.new(
    'uf' => 'rf',
    'rf' => 'df',
    'df' => 'lf',
    'lf' => 'uf',

    'rfu' => 'dfr',
    'dfr' => 'lfd',
    'lfd' => 'ufl',
    'ufl' => 'rfu'
  )

  B = CubeRotation.new(
    'ub' => 'lb',
    'lb' => 'db',
    'db' => 'rb',
    'rb' => 'ub',

    'rub' => 'ulb',
    'ulb' => 'ldb',
    'ldb' => 'drb',
    'drb' => 'rub'
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


  R = CubeRotation.new(
    'ur' => 'br',
    'br' => 'dr',
    'dr' => 'fr',
    'fr' => 'ur',

    'fur' => 'ubr',
    'ubr' => 'bdr',
    'bdr' => 'dfr',
    'dfr' => 'fur'
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
