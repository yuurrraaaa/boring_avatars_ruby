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
  end
end
