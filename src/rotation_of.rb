module RotationOf

  module Array
    def rotation_of?(array)

      # Works searching the first element of self in array and rotating array
      # so that element be first, then comparing.
      # We must search all occurrences of the first element because it can be duplicated
      #
      return true if self == [] and array == []
      return false unless self.length == array.length

      possible_rotations =  array.each_index.select { |index| array[index] == self.first}

      until possible_rotations.empty?
        possible_rotation = possible_rotations.shift
        return true if array.rotate(possible_rotation) == self
      end

      false
    end
  end

end

Array.include RotationOf::Array



