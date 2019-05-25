require 'rspec'
require 'ruby_rubik/cycle'

RSpec.describe 'Cycle' do

  it 'creates objects' do
    c = Cycle.new
    expect(c).to be_kind_of(Cycle)
  end

  xit 'succeeds' do
    pending 'Not implemented'
  end

end