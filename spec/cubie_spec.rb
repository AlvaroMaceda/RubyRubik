require 'rspec'
require './src/cubie.rb'

describe 'Cubie' do

  it 'creates the class' do
    cubie = Cubie.new('ufl')
    expect(cubie).to be_kind_of(Cubie)
  end

  context 'Corner Cubies:' do

    it 'is the same of the same cubie' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('urb')
      expect(cubie_a.same? cubie_b).to be(true)
    end

    it 'is not the same of another corner cubie' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('flb')
      expect(cubie_a.same? cubie_b).to be(false)
    end

    it 'is not the same of another edge cubie' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('ur')
      expect(cubie_a.same? cubie_b).to be(false)
    end

    it 'is the same if its rotated' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('bur')
      cubie_c = Cubie.new('rbu')
      expect(cubie_a.same? cubie_b).to be(true)
      expect(cubie_a.same? cubie_c).to be(true)
      expect(cubie_b.same? cubie_c).to be(true)
    end

  end


  context 'Edge cubies:' do

    it 'is the same of the same cubie' do
      cubie_a = Cubie.new('bl')
      cubie_b = Cubie.new('bl')
      expect(cubie_a.same? cubie_b).to be(true)
    end

    it 'is not the same of another edge cubie' do
      cubie_a = Cubie.new('uf')
      cubie_b = Cubie.new('ub')
      expect(cubie_a.same? cubie_b).to be(false)
    end

    it 'is not the same of another corner cubie' do
      cubie_a = Cubie.new('uf')
      cubie_b = Cubie.new('ufb')
      expect(cubie_a.same? cubie_b).to be(false)
    end

    it 'is the same if its flipped' do
      cubie_a = Cubie.new('uf')
      cubie_b = Cubie.new('fu')
      expect(cubie_a.same? cubie_b).to be(true)
    end

  end

end