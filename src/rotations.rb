module Rotations

  # private_class_method :rotation_of?

  module Array

    def rotation_of?(array)
      Rotations::rotation_of?(self, array)
    end

  end

  module String

    def rotation_of?(string)
      Rotations::rotation_of?(self.chars, string.chars)
    end

  end

  class << self

    def number_of_rotations(array1, array2)
      # Works searching the first element of self in array and rotating array
      # so that element be first, then comparing.
      # We must search all occurrences of the first element because it can be duplicated
      #
      return 0 if array1 == [] and array2 == []
      return -1 unless array1.length == array2.length

      possible_rotations =  array2.each_index.select { |index| array2[index] == array1.first}

      until possible_rotations.empty?
        possible_rotation_index = possible_rotations.shift
        return possible_rotation_index if array2.rotate(possible_rotation_index) == array1
      end

      -1
    end

    def rotation_of?(array1,array2)
      number_of_rotations(array1, array2) >= 0
    end

  end

end

Array.include Rotations::Array
String.include Rotations::String


