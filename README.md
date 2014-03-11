# XXhash

This gem provides a pure Ruby implementation of the XXhash32 hashing algorithm described here: https://code.google.com/p/xxhash/.

It's intended to be (mostly) source compatible with the Gem provided by nashby: https://github.com/nashby/xxhash

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-xxHash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-xxHash

## Usage

```ruby
require 'ruby-xxhash'

text = "test"
seed = 12345

XXhash.xxh32(text, seed) # => 3834992036
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
