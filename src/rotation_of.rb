def rotation_of?(array1, array2)

  # Works searching the first element of array1 in array2 and rotating array2
  # so that element be first, then comparing.
  # We must search all occurrences of the first element because it can be duplicated
  #
  return true if array1 == [] and array2 == []
  return false unless array1.length == array2.length



  positions =  array2.each_index.select { |index| array2[index] == array1[0]}

  pos = positions[0]
  return false unless pos

  array2.rotate(pos) == array1
end

