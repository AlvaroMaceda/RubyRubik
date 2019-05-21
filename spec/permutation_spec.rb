require 'rspec'
require 'custom_matchers'
require './src/permutation.rb'

RSpec.describe 'Permutation' do

  it 'creates objects' do
    p = Permutation.new({})
    expect(p).to be_kind_of(Permutation)
  end

  it 'must be biyective' do
    # injective: F(x)=F(y)⟹x=y

    # This is not inyective: there are two elements with the same image
    expect {
      Permutation.new(
          {
              :a => :b,
              :b => :c,
              :c => :c,
              :d => :b
          }
      )
    }.to raise_error RuntimeError

    # This should fail because F(c)=c and F(b)=c, too (c will remain unchanged)
    # and element :a won't have an image (the function won't be surjective)
    expect {
      Permutation.new(
          {
              :a => :b,
              :b => :c
          }
      )
    }.to raise_error RuntimeError
  end

  it 'applies a permutation to a set' do
    p = Permutation.new({
                            :a => :b,
                            :b => :c,
                            :c => :a
                        })
    original_set = [:a,:b,:c]
    expected_result = [:b,:c,:a]

    result = p.apply_to(original_set)
    expect(result).to eq(expected_result)

    p = Permutation.new({
                            :a => :c,
                            :c => :a,
                            :j => :k,
                            :k => :j
                        })
    original_set = [:b,:c,:a]
    expected_result = [:b,:a,:c]
    result = p.apply_to(original_set)
    expect(result).to eq(expected_result)

  end

  it 'calculates its inverse' do
    # The inverse of a permutation applied after or before the permutation is the identity permutation
    p = Permutation.new({
                              :a => :b,
                              :b => :c,
                              :c => :a
                          })
    original_set = [:c,:b,:a, :d, :j]

    original_applied = p.apply_to(original_set)
    both_applied = (!p).apply_to(original_applied)
    expect(both_applied).to eql(original_set)

    inverse_applied = (!p).apply_to(original_set)
    both_applied = p.apply_to(inverse_applied)
    expect(both_applied).to eql(original_set)
  end

  it 'pipes with another permutation' do
    p1 = Permutation.new({
                             :a => :b,
                             :b => :c,
                             :c => :a
                         })
    p2 = Permutation.new({
                             :a => :c,
                             :c => :a
                         })
    expected_product = Permutation.new({
        :a => :b,
        :b => :a
    })

    p12 = p1*p2
    expect(p12).to eql(expected_product)

  end

  it 'pipes with itself' do
    p = Permutation.new({
                            :a => :b,
                            :b => :c,
                            :c => :a
                        })
    expected_product = Permutation.new({
                                           :a => :c,
                                           :b => :a,
                                           :c => :b
                                       })
    p2 = p*p
    expect(p2).to eql(expected_product)
  end

  it 'calculates its positive power' do
    p = Permutation.new({
                             :a => :b,
                             :b => :c,
                             :c => :a
                         })
    expected = Permutation.new({
                               :a => :c,
                               :b => :a,
                               :c => :b
                           })

    p2 = p^2
    expect(p2).to eql(expected)

    # The above permutation has cycle length=3
    p3 = p^3
    expected = Permutation::IDENTITY
    expect(p3).to eql(expected)

    # 7 = 3+3+1 = identity*identity*p = p
    p7 = p^7
    expected = p
    expect(p7).to eql(expected)
  end

  it 'power to 0 equals identity' do
    p = Permutation.new({
                            :a => :b,
                            :b => :c,
                            :c => :a,
                            :d => :e,
                            :e => :d
                        })
    p0 = p^0
    expect(p0).to eql(Permutation::IDENTITY)
  end

  it 'calculates its negative power' do

    p = Permutation.new({
                            :a => :b,
                            :b => :c,
                            :c => :a,
                            :d => :e,
                            :e => :d
                        })
    pinv = p^-1
    expect(pinv).to eql(!p)

    # Cycles: [[:a, :b, :c], [:d, :e]]
    expect(p^-6).to eql(Permutation::IDENTITY)

    cycle_of_two = Permutation.new({
                                       :d=>:e,
                                       :e=>:d
                                   })
    expect(p^-3).to eql(cycle_of_two)
  end

  it 'has an identity pemutation' do
    p1 = Permutation.new({
                             :a => :b,
                             :b => :c,
                             :c => :a
                         })
    identity = Permutation::IDENTITY

    p2 = p1 * identity
    expect(p2).to eql(p1)

    p2 = identity * p1
    expect(p2).to eql(p1)
  end

  it 'is associative' do
    p1 = Permutation.new({
                             :a => :b,
                             :b => :e,
                             :c => :a,
                             :d => :c,
                             :e => :d
                         })
    p2 = Permutation.new({
                             :a => :b,
                             :b => :c,
                             :c => :a
                         })
    p3 = Permutation.new({
                             :a => :c,
                             :b => :a,
                             :c => :b,
                             :d => :e,
                             :e => :d
                         })

    expect((p1)*(p2*p3)).to eql((p1*p2)*p3)
  end

  it 'obtains the cycle form' do

    p = Permutation.new({
                            :a => :b,
                            :b => :c,
                            :c => :a
                        })
    expected_cycles = [
        [:c, :a, :b]
    ]
    expect(p.cycles).to be_the_same_cycles_as(expected_cycles)


    p = Permutation.new({
                            :a => :b,
                            :b => :a,
                            :c => :e,
                            :d => :c,
                            :e => :d
                        })
    expected_cycles = [
        [:a,:b],[:c, :e, :d]
    ]
    expect(p.cycles).to be_the_same_cycles_as(expected_cycles)

  end

end