# frozen_string_literal: true

module BoringAvatarsRuby
  class AvatarIdenticon < Avatar
    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)
      size = (options[:grid_size] * options[:square_size]) + (options[:border_size] * 2)

      @svg = <<~SVG
        <svg
          viewBox="0 0 #{size} #{size}"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          width="#{size}"
          height="#{size}"
        >
          <mask
            id="mask0"
            mask-type="alpha"
            maskUnits="userSpaceOnUse"
            x="0"
            y="0"
            width="#{size}"
            height="#{size}"
          >
            <rect width="#{size}" height="#{size}" fill="white"></rect>
          </mask>
          <g mask="url(#mask0)">
            #{"<rect width=\"#{size}\" height=\"#{size}\" fill=\"#{options[:background_color]}\"></rect>" unless options[:background_color] == :transparent}
            #{generate_identicon(options).join("\n")} 
          </g>
        </svg>
      SVG
    end

    def generate_identicon(options)
      raise "name cannot be nil" if options[:name].nil?
      raise "key is nil or less than 16 bytes" if options[:key].nil? || options[:key].length < 16
      raise "grid_size must be between 4 and 9" if options[:grid_size] < 4 || options[:grid_size] > 9
      raise "invalid border size" if options[:border_size] < 0
      raise "invalid square size" if options[:square_size] < 0

      hash = SipHash.digest(options[:key], options[:name].to_s)

      # set the foreground color by using the first three bytes of the hash value
      color = "#%02X%02X%02X" % [hash & 0xff, (hash >> 8) & 0xff, (hash >> 16) & 0xff]

      # remove the first three bytes that were used for the foreground color
      hash >>= 24

      sqx = sqy = 0
      squares = []
      (options[:grid_size] * ((options[:grid_size] + 1) / 2)).times do
        if hash & 1 == 1
          x = options[:border_size] + (sqx * options[:square_size])
          y = options[:border_size] + (sqy * options[:square_size])

          # left hand side
          squares << "<rect x=\"#{x}\" y=\"#{y}\" width=\"#{options[:square_size]}\" height=\"#{options[:square_size]}\" fill=\"#{color}\"></rect>"

          # mirror right hand side
          x = options[:border_size] + ((options[:grid_size] - 1 - sqx) * options[:square_size])
          squares << "<rect x=\"#{x}\" y=\"#{y}\" width=\"#{options[:square_size]}\" height=\"#{options[:square_size]}\" fill=\"#{color}\"></rect>"
        end

        hash >>= 1
        sqy += 1
        if sqy == options[:grid_size]
          sqy = 0
          sqx += 1
        end
      end

      squares
    end
  end
end
