require_relative 'cubie'
# require_relative 'cube_rotation.rb'
# require_relative 'rotation_of.rb'

# F = CubeRotation::F
# p F.cycles

# h = {
#   a: :b,
#   b: :c
# }
#
# p h.key(:c)


# class Banana
#
#   def == something
#     puts '=='
#     true
#   end
#
#   def eql? something
#     puts 'eql?'
#     true
#   end
#
# end
#
# a = Banana.new
# puts a == 'hola'

# a = Cubie.new('ufl')
# b = Cubie.new('rbd')
# c = Cubie.new('urf')
#
# h = {
#     a => b,
#     b => c
# }

rfl = Cubie.new('rfl')
flr = Cubie.new('flr')
foo = Cubie.new('foo')

p = {
    flr => foo
}
res = rfl.permute(p)
p res

# puts "papaya"
# puts "*#{h.keys.index(b)}*"
# p "*#{h.keys[h.keys.index(b)]}*"
#
# p h.keys[h.keys.index(b)]
# p b
# puts "banana"


# Cube = CubeRotation
# F = Cube::F
# f2 = F^2
# # f2 = F*F
# # puts F.changes
# # puts f2.class.name
# puts f2.changes











