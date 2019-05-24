require 'rspec/expectations'
require 'rotations'


def has_same_cycles(array1, array2)
  array1 = array1.clone
  array2 = array2.clone

  until array1.empty?
    checking = array1.shift
    index_of_element = search_element_rotated(array2,checking)
    return false unless index_of_element

    array2.delete_at index_of_element
  end

  array2.empty?
end

def search_element_rotated(array,search)
  array.index { |element| search.rotation_of?(element) }
end

RSpec::Matchers.define :be_the_same_cycles_as do |expected|

  match do |actual|
    has_same_cycles actual,expected
  end

  failure_message do |actual|
    "expected that #{actual} would contain the same cycles of #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not contain the same cycles of #{expected}"
  end

  description do
    "should be a rotation of #{expected}"
  end

end

RSpec::Matchers.define :be_a_rotation_of do |expected|

  match do |actual|
    actual.rotation_of? expected
  end

  failure_message do |actual|
    "expected that #{actual} would be a rotation of #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not be a rotation of #{expected}"
  end

  description do
    "should be a rotation of #{expected}"
  end

end
