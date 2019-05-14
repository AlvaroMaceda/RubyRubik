require_relative 'permutation.rb'

# p1 = Permutation.new({
#                           'uf' => 'ul',
#                           'ul' => 'ub',
#                           'ub' => 'ur',
#                           'ur' => 'uf'
#                       })
#
# p p1.cycles

# p1 = {
#     :a => :b,
#     :b => :c,
#     :c => :a
# }
# p1 = Permutation.new(p1)
#
# p2 = {
#     :a => :c,
#     :c => :a,
#     :j => :k,
#     :k => :j
# }
# p2 = Permutation.new(p2)
#
# p12 = p1 * p2
# puts p12
#

F = Permutation.new({
  'uf'=>'ul',
  'ul'=>'ub',
  'ub'=>'ur',
  'ur'=>'uf'
})

R = Permutation.new({
'ur'=>'br',
'br'=>'dr',
'dr'=>'fr',
'fr'=>'ur'
})



FR = F*R
puts FR

a = {
    "a" => "b",
    :c => :d,
    [1] => [2,3]
}

b = {
    :c => :d,
    "a" => "b",
    [1] => [2,3]
}

puts "Iguales" if a==b


