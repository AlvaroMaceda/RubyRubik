require 'rspec'
require './src/rotation_checking.rb'

RSpec.describe 'rotation_of?' do

  it 'accepts the array unchanged' do
    array1 = %i[a b c d]
    expect(rotation_of?(array1, array1)).to be true
  end

  it 'accepts the array rotated' do
    array1 = %i[a b c d]
    array2 = %i[b c d a]
    expect(rotation_of?(array1, array2)).to be true

    array2 = %i[c d a b]
    expect(rotation_of?(array1, array2)).to be true

    array2 = %i[d a b c]
    expect(rotation_of?(array1, array2)).to be true
  end

  it 'returns false if not a rotation' do
    array1 = %i[a b c d]
    array2 = %i[a b d c]
    expect(array1.rotation_of? array2).to be false

    # array2 = %i[ ]
  end

  it 'works if there are duplicated members in the array' do
    array1 = %w[one two three one]
    array2 = %w[one one two three]
    expect(rotation_of?(array1, array2)).to be true

    array2 = %w[one one three two]
    expect(rotation_of?(array1, array2)).to be false

    array2 = %w[one one two three]
    expect(rotation_of?(array1, array2)).to be true
  end

  it 'returns false if have different members' do
    array1 = %i[a b c d]
    array2 = %i[a b c]
    expect(rotation_of?(array1, array2)).to be false
  end

  it 'works with empty arrays' do
    expect(rotation_of?([], [])).to be true
  end

end