# frozen_string_literal: true

module BoringAvatarsRuby
  module Utilities
    # sums the characters in the string
    def self.get_number(name)
      name.to_s.chars.sum(&:ord)
    end

    # returns a color from the palette
    def self.get_random_color(number, colors, range)
      colors[number % range]
    end

    def self.get_digit(number, ntn)
      (number / 10.pow(ntn)) % 10
    end

    def self.get_unit(number, range, index = nil)
      value = number % range

      if index && (get_digit(number, index) % 2) == 0
        -value
      else
        value
      end
    end

    def self.get_contrast(hexcolor)
      hexcolor = hexcolor.slice(1) if hexcolor.slice(0, 1) == '#'
      r        = hexcolor[0..1].to_i
      g        = hexcolor[2..3].to_i
      b        = hexcolor[4..5].to_i
      yiq      = ((r * 299) + (g * 587) + (b * 114)) / 1000
      yiq >= 128 ? '#000000' : '#FFFFFF'
    end

    def self.get_boolean(number, ntn)
      get_digit(number, ntn) % 2 == 1
    end
  end
end
