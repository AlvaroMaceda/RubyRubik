require 'rspec'
require 'ruby_rubik/cubie'

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

  it 'doesn\'t change if the permutation not affects the cubie' do
    cubie = Cubie.new('luf')
    permutation = { Cubie.new('bdr') => Cubie.new('rfu')}
    cubie_permuted = cubie.permute(permutation)
    expect(cubie_permuted.same?cubie).to be(true)
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

    expect(cubie_permuted.same?(expected_cubie)).to be(true)
  end

  context 'Corner Cubies:' do

    it 'is equal to the same cubie' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('urb')
      expect(cubie_a.same? cubie_b).to be(true)
    end

    it 'is not equal to another corner cubie' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('flb')
      expect(cubie_a).not_to eql(cubie_b)
    end

    it 'is not equal to another edge cubie' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('ur')
      expect(cubie_a.same? cubie_b).to be(false)
    end

    it 'is equal if its rotated' do
      cubie_a = Cubie.new('urb')
      cubie_b = Cubie.new('bur')
      cubie_c = Cubie.new('rbu')
      cubie_d = Cubie.new('rub')
      expect(cubie_a).to eql(cubie_b)
      expect(cubie_a).to eql(cubie_c)
      expect(cubie_b).to eql(cubie_c)
      expect(cubie_a).not_to eql(cubie_d)
    end

    it 'is the same as the same cubie' do
      cubie_a = Cubie.new('blf')
      cubie_b = Cubie.new('blf')
      expect(cubie_a.same?cubie_b).to be(true)
    end

    it 'is not the same if it\s rotated' do
      cubie_a = Cubie.new('blf')
      cubie_b = Cubie.new('lfb')
      expect(cubie_a.same?(cubie_b)).to be(false)
    end

  end


  context 'Edge cubies:' do

    it 'is equal to the same cubie' do
      cubie_a = Cubie.new('bl')
      cubie_b = Cubie.new('bl')
      expect(cubie_a).to eql(cubie_b)
    end

    it 'is not equal to another edge cubie' do
      cubie_a = Cubie.new('uf')
      cubie_b = Cubie.new('ub')
      expect(cubie_a).not_to eql(cubie_b)
    end

    it 'is not equal to another corner cubie' do
      cubie_a = Cubie.new('uf')
      cubie_b = Cubie.new('ufb')
      expect(cubie_a).not_to eql(cubie_b)
    end

    it 'is equal if its flipped' do
      cubie_a = Cubie.new('uf')
      cubie_b = Cubie.new('fu')
      expect(cubie_a).to eql(cubie_b)
    end

    it 'is the same as the same cubie' do
      cubie_a = Cubie.new('bl')
      cubie_b = Cubie.new('bl')
      expect(cubie_a.same?cubie_b).to be(true)
    end

    it 'is not the same if it\s flipped' do
      cubie_a = Cubie.new('uf')
      cubie_b = Cubie.new('fu')
      expect(cubie_a.same?(cubie_b)).to be(false)
    end

  end

end