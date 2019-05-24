require 'rspec'
require 'ruby_rubik'

Cube = RubyRubik
F = Cube::F
# R = Cube::R
# U = Cube::U

RSpec.describe 'CubeRotation' do

  it 'remains the same if a face is rotated four times' do
    expect(Cube::F^4).to eql Cube::IDENTITY
  end

  it 'returns changes as a hash of strings' do
    pending
    FR = ''
  end

  it 'return cycles positions as strings' do
    pending
    F2 = [["uf", "bf"], ["lf", "rf"], ["ufl", "dfr"], ["urf", "dlf"]]
  end

  it 'manages rotations' do
    # noinspection RubyStringKeysInHashInspection
    expected_f2 = {
      'uf' => 'bf',
      'lf' => 'rf',
      'bf' => 'uf',
      'rf' => 'lf',
      'ufl' => 'dfr',
      'urf' => 'dlf',
      'rdf' => 'luf',
      'dlf' => 'urf'
    }
    expect((F^2).changes).to eql expected_f2

  end

end
