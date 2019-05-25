require 'rspec/expectations'
require 'ruby_rubik/cycles'

RSpec::Matchers.define :be_the_same_cycles_as do |expected|

  match do |actual|
    Cycles::same? actual,expected
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
