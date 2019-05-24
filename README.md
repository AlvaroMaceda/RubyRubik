# RubyRubik

Utilities for working with Rubik's cube permutation group.

This gem provides cube's rotations: 
- RubiRubik::F = {TODO}
- RubiRubik::R = {TODO}
- etc. 

You can combine permutations:
```ruby
R = RubyRubik::R
F = RubyRubik::F
puts F*R
    
```
Get the inverse of a permutation:
```ruby
TO-DO: put an example here
```
Power the permutation to a positive or negative number:
```ruby
TO-DO: put an example here
```
Print the cycles of a permutation:
```ruby
TO-DO: put an example here
```
The gem also includes an utility for working with permutations in general in the form:
```ruby
require 'ruby_rubik/permutation'
TO-DO: put an example here
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_rubik'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_rubik

## Usage

To use the gem:
```ruby
TO-DO: put an example here
```

You can use it with irb:
```shell
$irb -r ruby_rubik
TODO: put an example here
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AlvaroMaceda/ruby_rubik. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as Public Domain.

