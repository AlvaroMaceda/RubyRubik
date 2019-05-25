require 'rspec'
require 'ruby_rubik/cycles'

RSpec.describe 'Cycle' do

  it 'creates objects' do
    c = Cycles.new
    expect(c).to be_kind_of(Cycles)
  end

  it 'differentiates different cycles' do
    cycle1 = [[:c,:d,:e]]
    cycle2 = [[:c,:d]]
    expect(Cycles::same?(cycle1, cycle2)).to be false

    cycle1 = [[:c,:d,:e]]
    cycle2 = [[:c,:d,:f]]
    expect(Cycles::same?(cycle1, cycle2)).to be false

    cycle1 = [[:a ,:b],[:c,:d,:e]]
    cycle2 = [[:a ,:b]]
    expect(Cycles::same?(cycle1, cycle2)).to be false
  end

  it 'compares two identical cycles' do
    cycle1 = [[:c,:d,:e]]
    cycle2 = [[:c,:d,:e]]
    expect(Cycles::same?(cycle1, cycle2))

    cycle1 = [[:a ,:b],[:c,:d,:e]]
    cycle2 = [[:a ,:b],[:c,:d,:e]]
    expect(Cycles::same?(cycle1, cycle2))
  end

  it 'compares two cycles with cycles in different order' do
    cycle1 = [[:a ,:b],[:c,:d,:e]]
    cycle2 = [[:c,:d,:e],[:a ,:b]]
    expect(Cycles::same?(cycle1, cycle2))
  end

  it 'compares two cycles with elements rotated inside the cycles' do
    cycle1 = [[:a ,:b],[:c,:d,:e]]
    cycle2 = [[:a ,:b],[:d,:e,:c]]
    expect(Cycles::same?(cycle1, cycle2))

    cycle1 = [[:a ,:b],[:c,:d,:e]]
    cycle2 =  [[:b ,:a],[:c,:d,:e]]
    expect(Cycles::same?(cycle1, cycle2))
  end

  it 'cant be initialized with non-array objects' do
    expect {
      Cycles.new('banana')
    }.to raise_error RuntimeError
  end


end