require 'rspec/expectations'


RSpec::Matchers.define :be_a_rotation_of do |expected_array|

  match do |actual|
    raise "ToDo"
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
