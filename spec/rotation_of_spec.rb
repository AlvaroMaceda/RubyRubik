require 'rspec'
require './src/rotation_of.rb'

RSpec.describe 'rotation_of?' do

  context 'Arrays' do

    it 'accepts the array unchanged' do
      array1 = %i[a b c d]
      expect(array1.rotation_of?(array1)).to be true
    end

    it 'accepts the array rotated' do
      array1 = %i[a b c d]
      array2 = %i[b c d a]
      expect(array1.rotation_of?(array2)).to be true

      array2 = %i[c d a b]
      expect(array1.rotation_of?(array2)).to be true

      array2 = %i[d a b c]
      expect(array1.rotation_of?(array2)).to be true
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
      expect(array1.rotation_of?(array2)).to be true

      array2 = %w[one one three two]
      expect(array1.rotation_of?(array2)).to be false

      array2 = %w[one one two three]
      expect(array1.rotation_of?(array2)).to be true
    end

    it 'returns false if have different members' do
      array1 = %i[a b c d]
      array2 = %i[a b c]
      expect(array1.rotation_of?(array2)).to be false
    end

    it 'works with empty arrays' do
      expect([].rotation_of?([])).to be true
    end

  end

  context 'Strings' do

    it 'accepts the string unchanged' do
      string1 = 'abc de'
      expect(string1.rotation_of?(string1)).to be true
    end

    it 'accepts the string rotated' do
      string1 = 'abc de'
      string2 = 'eabc d'
      expect(string1.rotation_of?(string2)).to be true

      string2 = 'deabc '
      expect(string1.rotation_of?(string2)).to be true

      string2 = ' deabc'
      expect(string1.rotation_of?(string2)).to be true
    end

    it 'returns false if not a rotation' do
      string1 = 'abc de'
      string2 = 'acb de'
      expect(string1.rotation_of? string2).to be false
    end

    it 'works if there are duplicated members in the string' do
      string1 = 'abcaab'
      string2 = 'ababca'
      expect(string1.rotation_of?(string2)).to be true

      string2 = 'abcaba'
      expect(string1.rotation_of?(string2)).to be false

      string2 = 'caabab'
      expect(string1.rotation_of?(string2)).to be true
    end

    it 'returns false if have different length' do
      string1 = 'banana'
      string2 = 'bananaa'
      expect(string1.rotation_of?(string2)).to be false
    end

    it 'works with empty strings' do
      expect(''.rotation_of?('')).to be true
    end

  end

end