require_relative 'permutation.rb'
require_relative 'rotation_of.rb'

# F = Permutation.new({
#   'uf'=>'ul',
#   'ul'=>'ub',
#   'ub'=>'ur',
#   'ur'=>'uf'
# })
#
# R = Permutation.new({
# 'ur'=>'br',
# 'br'=>'dr',
# 'dr'=>'fr',
# 'fr'=>'ur'
# })

actual = [
    [:e, :d, :c],
    [:b,:a],
    # [:banana]
]
expected = [
    [:a,:b],
    [:c, :e, :d],
    [:banana]
]

def banana(actual,expected)
  until actual.empty?
    checking = actual.shift
    i = expected.index { |element| rotation_of?(checking,element) }
    return false unless i

    expected.delete_at i
  end
  expected.empty?
end

puts banana(actual,expected)



















