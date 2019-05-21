module RotationOf

  # private_class_method :rotation_of?

  module Array

    def rotation_of?(array)
      RotationOf::rotation_of?(self,array)
    end

  end

  module String

    def rotation_of?(string)
      RotationOf::rotation_of?(self.chars,string.chars)
    end

  end

  class << self

    def rotation_of?(array1,array2)
      # Works searching the first element of self in array and rotating array
      # so that element be first, then comparing.
      # We must search all occurrences of the first element because it can be duplicated
      #
      return true if array1 == [] and array2 == []
      return false unless array1.length == array2.length

      possible_rotations =  array2.each_index.select { |index| array2[index] == array1.first}

      until possible_rotations.empty?
        possible_rotation = possible_rotations.shift
        return true if array2.rotate(possible_rotation) == array1
      end

      false
    end

  end

end

Array.include RotationOf::Array
String.include RotationOf::String



