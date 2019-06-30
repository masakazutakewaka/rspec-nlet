# Rspec::Nlet

This gem is a RSpec extension to define multiple helpers with `let`.

Every helpers defined is lazy loaded.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-nlet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-nlet

## Usage

```ruby
# define multiple helpers
> let(:one, :two, :three) { [1,2,3] }
> one # => 1
> two # => 2
> three # => 3

# define a helper
> let(:single) { 'single' }
> single # => 'single'

# accept nil
> let(:nil) { nil }
> nil # => nil

# can be overriden
> let(:over, :ride) { ['over', 'ride'] }
> let(:over, :ride) { [:over, 'riden'] }
> over # => :over
> ride # => 'riden'

# raise an error when too few names are passed
> let(:too, :few) { [1,2,3] }
> few # => StandardError (Too few names)

# raise an error when too many names are passed
> let(:too, :many) { [1] }
> many # => StandardError (Too many names)

# raise an error when names are duplicated
> let(:dup, :dup) { [1,2] }
> dup # => StandardError (Names are duplicated)

# raise an error when a block returns an object other than Array
> let(:no, :array) { 1 }
> no # => StandardError (Block returns non Array object)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rspec-nlet.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
