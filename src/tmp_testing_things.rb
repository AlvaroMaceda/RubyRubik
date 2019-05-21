# require_relative 'cube_rotation.rb'
require_relative 'rotation_of.rb'

# F = CubeRotation::F
# p F.cycles


Array.include RotationOf
puts [1,2,3].rotation_of? [3,1,2]












