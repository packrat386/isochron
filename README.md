# Isochron

A gem to do something exactly once. Inspired by Go's [sync.Once](https://golang.org/pkg/sync/#Once).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'isochron'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isochron

## Usage

```ruby
mylist = ['a', 'b', 'c']

# returns a capture object holding the passed block
cap = Isochron.capture do
  mylist.pop
end

# the first call executes the block, subsequent calls return the stored value
pp cap.call
pp cap.call
pp mylist

=begin
 [fg-386] isochron > ruby example.rb
"c"
"c"
["a", "b"]
=end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/packrat386/isochron. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Isochron project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/packrat386/isochron/blob/master/CODE_OF_CONDUCT.md).
