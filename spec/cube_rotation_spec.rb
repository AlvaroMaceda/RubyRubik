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


end
