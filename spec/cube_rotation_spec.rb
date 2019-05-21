require 'rspec'
require_relative '../src/cube_rotation.rb'

Cube = CubeRotation

RSpec.describe 'CubeRotation' do


  xit 'has "F" basic rotation' do
    front_changes = {
        'uf' => 'rf',
        'lf' => 'uf',
        'bf' => 'lf',
        'rf' => 'bf'
    }
    expect(Cube::F.changes).to eql(f_changes)
  end

  xit 'has "B" basic rotation' do
    back_changes = {
    }
    expect(Cube::F.changes).to eql(f_changes)
  end

  xit 'has "U" basic rotation' do
    up_changes = {
    }
    expect(Cube::F.changes).to eql(f_changes)
  end

  xit 'has "D" basic rotation' do
    down_changes = {
    }
    expect(Cube::F.changes).to eql(f_changes)
  end

  xit 'has "L" basic rotation' do
    left_changes = {
    }
    expect(Cube::F.changes).to eql(f_changes)
  end

  xit 'has "R" basic rotation' do
    right_changes = {
    }
    expect(Cube::F.changes).to eql(f_changes)
  end


end
