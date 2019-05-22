require 'rspec'
require_relative '../src/cube_rotation.rb'

Cube = CubeRotation
F = Cube::F
# R = Cube::R
# U = Cube::U

RSpec.describe 'CubeRotation' do

  it 'remains the same if a face is rotated four times' do
    expect(Cube::F^4).to eql Cube::IDENTITY
  end

  xit 'manages rotations' do
    expected_f2 = {
      # 'uf'=>'bf',
      # 'lf'=>'rf',
      # 'bf'=>'uf',
      # 'rf'=>'lf',
      'ufl'=>'dfr',
      'urf'=>'dlf',
      'rdf'=>'luf',
      'dlf'=>'urf'
    }
    expect((F^2).changes).to eql expected_f2
    
  end

end
