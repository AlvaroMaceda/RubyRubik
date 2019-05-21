require_relative './permutation.rb'

class CubeRotation < Permutation

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

  U = CubeRotation.new(
    'uf' => 'ul',
    'ul' => 'ub',
    'ub' => 'ur',
    'ur' => 'uf',

    '' => '',
    '' => '',
    '' => '',
    '' => ''
  )

  R = CubeRotation.new(
    'ur' => 'br',
    'fr' => 'ur',
    'dr' => 'fr',
    'br' => 'dr',

    '' => '',
    '' => '',
    '' => '',
    '' => ''
  )

  x = CubeRotation.new(
    '' => '',
    '' => '',
    '' => '',
    '' => '',

    '' => '',
    '' => '',
    '' => '',
    '' => ''
  )

end
