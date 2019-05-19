require 'rspec/expectations'
require './src/rotation_of.rb'


RSpec::Matchers.define :be_the_same_cycles_as do |expected|

  match do |actual|

    actual = actual.clone
    expected = expected.clone

    until actual.empty?
      checking = actual.shift
      i = expected.index { |element| rotation_of?(checking,element) }
      return false unless i

      expected.delete_at i
    end

    expected.empty?
  end

  failure_message do |actual|
    "expected that #{actual} would contain the same cycles of #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not contain the same cycles of #{expected}"
  end

  # For --format documentation parameter of rspec
  description do
    "should be a rotation of #{expected}"
  end

end

RSpec::Matchers.define :be_a_rotation_of do |expected|

  match do |actual|
    rotation_of? actual, expected
  end

  failure_message do |actual|
    "expected that #{actual} would be a rotation of #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not be a rotation of #{expected}"
  end

  # For --format documentation parameter of rspec
  description do
    "should be a rotation of #{expected}"
  end

end

RSpec::Matchers.define :be_a_multiple_of do |expected|

  match do |actual|
    actual % expected == 0
  end

  failure_message do |actual|
    "expected that #{actual} would be a multiple of #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not be a multiple of #{expected}"
  end

  # For --format documentation parameter of rspec
  description do
    "should be multiple of #{expected}"
  end

end
