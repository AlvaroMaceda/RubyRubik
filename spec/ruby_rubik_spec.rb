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

  xit 'returns cycles of a face rotation' do
    expected_cycles = [
      ['uf','rf','df','lf'],
      ['ufl','rfu','dfr','lfd']
    ]
    expect(F.cycles).to be_the_same_cycles_as(expected_cycles)
  end

  xit 'show items which are only twisted in rotations' do
    fr = F*R
    expected_changes = {
      'uf' => 'ru',
      'rf' => 'df',
      'df' => 'lf',
      'lf' => 'uf',

      'ur' => 'br',
      'br' => 'dr',
      'dr' => 'fr',

      'ufl' => 'rub',
      'urf' => 'rfu',
      'rdf' => 'dlf',
      'fdl' => 'flu',

      'ubr' => 'bdr',
      'bdr' => 'dfr',
    }
    expect(fr.changes).to eql(expected_changes)
  end

  xit 'returns changes as a hash of strings' do
    pending
    fr = ''
  end

  xit 'manages rotations' do
    # noinspection RubyStringKeysInHashInspection
    expected_f2 = {
      'uf' => 'df',
      'lf' => 'rf',
      'df' => 'uf',
      'rf' => 'lf',
      'ufl' => 'dfr',
      'urf' => 'dlf',
      'rdf' => 'luf',
      'dlf' => 'urf'
    }
    expect((F^2).changes).to eql expected_f2
  end

  xit 'return cycles positions as strings' do
    f2 = F*F
    expected_cycles = [
      ['uf', 'df'], ['lf', 'rf'],
      ['ufl', 'dfr'], ['urf', 'dlf']
    ]
    expect(f2.cycles).to be_the_same_cycles_as(expected_cycles)
  end

  xit 'marks twisted cycles' do
    # _FR = !F*!R
    # p _FR.cycles


    fri = F*!R
    expected_cycles = [
        ['uf', 'rd', 'rb', 'ru', 'rf', 'df', 'lf'],
        ['ufl', 'rdf', 'dlf','+'],
        ['urf', 'rbd', 'rub','-']
    ]
    expect(fri.cycles).to be_the_same_cycles_as(expected_cycles)
  end

end
