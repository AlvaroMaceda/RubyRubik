require_relative 'cubie'
# require_relative 'cube_rotation.rb'
# require_relative 'rotation_of.rb'

# F = CubeRotation::F
# p F.cycles



puts "Banana" if 0

a = [1,2,3,4]
b = [4,1,2,3]
c = [3,4,1,2]
d = [2,3,4,1]
n = [1,2,4,3]

puts number_of_rotations(a, a)
puts number_of_rotations(a, b)
puts number_of_rotations(a, c)
puts number_of_rotations(a, d)
puts number_of_rotations(a, n)

# rfl = Cubie.new('rfl')
# flr = Cubie.new('flr')
# abc = Cubie.new('BCA')
#
# p = {
#     flr => abc
# }
# res = rfl.permute(p)
# p res






# Cube = CubeRotation
# F = Cube::F
# f2 = F^2
# # f2 = F*F
# # puts F.changes
# # puts f2.class.name
# puts f2.changes











