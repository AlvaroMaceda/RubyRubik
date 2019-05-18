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


p2i = Permutation.new({
                         :b => :a,
                         :c => :b,
                         :a => :c
                     })

p = Permutation.new({
                        :a => :b,
                        :b => :c,
                        :c => :a,
                        :d => :e,
                        :e => :d
                    })
p p.cycles
p p^-6
p p^-3
p p^6

# puts (p1*p2*p3).changes
# puts ((p1)*(p2*p3)).changes
# puts ((p1*p2)*(p3)).changes

#p (p1*p2*p3).cycles






















