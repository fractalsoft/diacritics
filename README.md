# Diacritics [![Gem Version](https://badge.fury.io/rb/diacritics.png)](http://badge.fury.io/rb/diacritics) [![Build Status](https://travis-ci.org/fractalsoft/diacritics.png)](https://travis-ci.org/fractalsoft/diacritics) [![Dependency Status](https://gemnasium.com/fractalsoft/diacritics.png)](https://gemnasium.com/fractalsoft/diacritics) [![Coverage Status](https://coveralls.io/repos/fractalsoft/diacritics/badge.png)](https://coveralls.io/r/fractalsoft/diacritics)
[![endorse](https://api.coderwall.com/torrocus/endorsecount.png)](https://coderwall.com/torrocus)

Diacritics is a gem which support downcase, upcase and permanent link with diacritical characters.

## Installation

Add this line to your application's Gemfile:

    gem 'diacritics'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install diacritics

## Usage

```ruby
Diacritics::downcase(text)
Diacritics::upcase(text)
Diacritics::permanent(text)
```

You can include methods into String class:

```ruby
class String
  include Diacritics::String
end
```

and use

```ruby
string.diacritics_downcase
string.diacritics_upcase
string.permanent_link
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request