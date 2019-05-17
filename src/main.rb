require_relative 'permutation.rb'


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
p p.cycles
p p*p
p p*p*p*p*p*p*p

# permutation_changes = {:a=>:b, :b=>:c, :c=>:a}
# changes_values = [:b,:c,:a]
# remaining = permutation_changes.delete_if do |key,_|
#   puts "key: #{key}"
#   changes_values.include? key
# end


























