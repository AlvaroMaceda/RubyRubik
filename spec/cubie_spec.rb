require 'rspec'
require './src/cubie.rb'

RSpec.describe 'Cubie' do

  it 'can be create from a string' do
    cubie = Cubie.new('ufl')
    expect(cubie).to be_kind_of(Cubie)
  end

  it 'converts to string' do
    cubie = Cubie.new('ufl')
    expect(cubie.to_s).to eql('ufl')
  end

  it 'can be created from another Cubie' do
    cubie = Cubie.new(Cubie.new('ufl'))
    expect(cubie.to_s).to eql('ufl')
  end

  it 'can be stored in a hash' do
    hash = {
        Cubie.new('ur') => Cubie.new('fr'),
        Cubie.new('bl') => Cubie.new('dr')
    }
    expect(hash[Cubie.new('bl')]).to eql(Cubie.new('dr'))

    hash = {
        Cubie.new('urb') => Cubie.new('frb'),
        Cubie.new('blf') => Cubie.new('dru'),
        # bfl is not a rotation of blf
        Cubie.new('bfl') => Cubie.new('bdu')
    }
    expect(hash[Cubie.new('blf')]).to eql(Cubie.new('dru'))
    expect(hash[Cubie.new('fbl')]).to eql(Cubie.new('dru'))
    expect(hash[Cubie.new('bfl')]).to eql(Cubie.new('bdu'))
  end

  xit 'applies a permutation' do
    pending
  end

  xit 'applies a string permutation' do
    pending
  end

  xit 'doesn\'t change if the permutation not affects the cubie' do
    pending
  end

  it 'applies a permutation with rotation' do
    # Pair each facelet
    # Permutation
    # ufl => rfu
    # urf => rdf
    # rdf => dlf
    # dlf => luf
    # Applying ufl=>rfu to luf
    # It gives now: rfu
    # It must give: urf
    # Applying urf => rdf to rfu
    # It gives now: rdf
    # It must give: dfr
    cubie = Cubie.new('luf')
    permutation = { Cubie.new('ufl') => Cubie.new('rfu')}
    cubie_permuted = cubie.permute(permutation)
    expected_cubie = Cubie.new('urf')

    expect().to be(true)
    raise "TODO"
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
      cubie_d = Cubie.new('rub')
      expect(cubie_a.same? cubie_b).to be(true)
      expect(cubie_a.same? cubie_c).to be(true)
      expect(cubie_b.same? cubie_c).to be(true)
      expect(cubie_b.same? cubie_d).to be(false)
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