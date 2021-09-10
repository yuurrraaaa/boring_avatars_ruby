# BoringAvatarsRuby

Boring Avatars Ruby is a Ruby implementation of [Boring Avatars](https://github.com/boringdesigners/boring-avatars) by boringdesigners. It generates SVG based avatars from any username and color palette in a variety of forms.

![boring avatars preview](https://github.com/CircleSD/boring_avatars_ruby/blob/main/public/boring-avatars-ruby-preview.png?raw=true)

![Build Status](https://github.com/CircleSD/boring_avatars_ruby/actions/workflows/main.yml/badge.svg?branch=main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'boring_avatars_ruby'
```

And then execute:

```ruby
bundle install
```

Or install it yourself as:

```ruby
gem install boring_avatars_ruby
```

## Usage

Creating an avatar with default properties and returning a string containing the SVG output

```ruby
avatar = BoringAvatarsRuby::Avatar.create({name: "Grace Hopper"})
```

Overriding default property values

```ruby
avatar = BoringAvatarsRuby::Avatar.create({
  colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
  name: "Grace Hopper",
  size: 120,
  variant: :marble
})
```

### Variants

There are a number of variants that have been carried over from Boring Avatars: -

* Marble
* Pixel
* Ring
* Sunset

Additionally, an `identicon` variant has been ported from [Ruby Identicon](https://github.com/chrisbranson/ruby_identicon)

### Properties

| Property | Type                                                         |
| -------- | ------------------------------------------------------------ |
| size     | number (verical and horizontal size in pixels)               |
| square   | boolean (a square avatar is created if `true`)               |
| name     | string                                                       |
| variant  | one of: `:marble`, `:pixel`, `:ring`, `:sunset`, `:identicon`|
| colors   | array of colors in rgb notation                              |

The `identicon` variant ignores the `color`, `size` and `square` properties and has the following additional properties: -

| Property           | Type                                                                                                                 |
| ----------------- | -------------------------------------------------------------------------------------------------------------------- |
| background_color  | string, default: `:transparent` (the background color of the identicon in rgb notation (e.g. 0xffffff for white))    |
| border_size       | number, default 35 (the size in pixels to leave as an empty border around the identicon image)                       |
| grid_size         | number, default 7 (the number of rows and columns in the identicon, minimum 4, maximum 9)                            |
| square_size       | number, default 50 (the size in pixels of each square that makes up the identicon)                                   |
| key               | string, a 16 byte key used by siphash when calculating the hash value (see note below)                               |

*Varying the key ensures uniqueness of an identicon for a given title, it is assumed desirable for different applications to use a different key.*

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/[USERNAME]/boring_avatars_ruby). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/boring_avatars_ruby/blob/main/CODE_OF_CONDUCT.md).

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BoringAvatarsRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/boring_avatars_ruby/blob/main/CODE_OF_CONDUCT.md).
