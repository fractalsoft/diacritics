# Diacritics
[![Gem Version](https://badge.fury.io/rb/diacritics.png)](http://badge.fury.io/rb/diacritics)
[![Build Status](https://travis-ci.org/fractalsoft/diacritics.png)](https://travis-ci.org/fractalsoft/diacritics)
[![Dependency Status](https://gemnasium.com/fractalsoft/diacritics.png)](https://gemnasium.com/fractalsoft/diacritics)
[![Coverage Status](https://coveralls.io/repos/fractalsoft/diacritics/badge.png)](https://coveralls.io/r/fractalsoft/diacritics)
[![Code Climate](https://codeclimate.com/repos/5284c9f156b1021a6e016740/badges/030f7f569aa0fa54ea66/gpa.png)](https://codeclimate.com/repos/5284c9f156b1021a6e016740/feed)
[![Stories in Ready](https://badge.waffle.io/fractalsoft/diacritics.png)](http://waffle.io/fractalsoft/diacritics)
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

You can include methods into String class:

```ruby
String.send(:include, Diacritics::String)
```

and use

```ruby
"ŁoreM Ìpsum Ðolór. Šit Ämet".downcase #=> "łorem ìpsum ðolór. šit ämet"
"łorem ìpsum ðolÓr. šit ämet".upcase #=> "ŁOREM ÌPSUM ÐOLÓR. ŠIT ÄMET"
"Łorem ìpsum ÐolÓr. Šit ämet".permanent #=> "lorem-ipsum-dolor-sit-aemet"
'lorem-ipsum-dolor-sit-aemet'.permanent? #=> true
'łorem ìpsum ðolór. šit ämet'.permanent? #=> false
'lorem-ipsum-dolor-sit-aemet'.slug? #=> true
'lorem@ipsum-dolor-sit-aemet'.slug? #=> false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
