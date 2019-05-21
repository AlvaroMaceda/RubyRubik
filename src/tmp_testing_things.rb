require_relative 'cube_rotation.rb'
require_relative 'rotation_of.rb'

# F = CubeRotation::F
# p F.cycles

# class Parent
#
#   def create
#     self.class.new
#   end
#
#   def create_in_child
#     create
#   end
#
# end
#
# class Child < Parent
#
#   def create_in_child
#     create
#   end
#
# end
#
# a = Child.new
# b = a.create_in_child
# puts b.class.name
#
#
# a = Parent.new
# b = a.create_in_child
# puts b.class.name

Cube = CubeRotation
F = Cube::F
# f2 = F^2
f2 = F*F
# puts F.changes
puts f2.class.name
puts f2.changes











