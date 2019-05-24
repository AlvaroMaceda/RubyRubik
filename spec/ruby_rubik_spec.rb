require 'rspec'
require 'ruby_rubik'
require 'custom_matchers'

Cube = RubyRubik
F = Cube::F
# B = Cube::B
R = Cube::R
# L = Cube::L
# U = Cube::U
# D = Cube::D

RSpec.describe 'CubeRotation' do

  it 'remains the same if a face is rotated four times' do
    expect(F^4).to eql Cube::IDENTITY
  end

  fit 'returns cycles of a face rotation' do
    expected_cycles = [
        ['uf','rf','df','lf'],
        ['ufl','rfu','dfr','lfd']
    ]
    p = F.cycles
    # expect(F.cycles).to be_the_same_cycles_as(expected_cycles)
  end

  xit 'returns changes as a hash of strings' do
    pending
    FR = ''
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

  it 'return cycles positions as strings' do
    F2 = F*F
    expected_cycles = [["uf", "bf"], ["lf", "rf"], ["ufl", "dfr"], ["urf", "dlf"]]
    expect(F2.cycles).to eql(expected_cycles)
  end

  it 'marks twisted cycles' do

  end

end
