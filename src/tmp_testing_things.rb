require_relative 'cubie'
# require_relative 'cube_rotation.rb'
# require_relative 'rotation_of.rb'

# F = CubeRotation::F
# p F.cycles


def rotations_of(array1,array2)
  # Works searching the first element of self in array and rotating array
  # so that element be first, then comparing.
  # We must search all occurrences of the first element because it can be duplicated
  #
  return true if array1 == [] and array2 == []
  return false unless array1.length == array2.length

  possible_rotations =  array2.each_index.select { |index| array2[index] == array1.first}

  until possible_rotations.empty?
    possible_rotation = possible_rotations.shift
    return possible_rotation if array2.rotate(possible_rotation) == array1
  end

  false
end

a = [1,2,3,4]
b = [4,1,2,3]
c = [3,4,1,2]
d = [2,3,4,1]
n = [1,2,4,3]

puts rotations_of(a,a)
puts rotations_of(a,b)
puts rotations_of(a,c)
puts rotations_of(a,d)
puts rotations_of(a,n)

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











