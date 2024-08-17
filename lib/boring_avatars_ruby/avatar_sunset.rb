# frozen_string_literal: true

module BoringAvatarsRuby
  class AvatarSunset < Avatar
    ELEMENTS = 4
    SIZE = 80

    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)
      properties = generate_colors(options[:name], options[:colors])
      name = options[:name].to_s.delete(" \t\r\n")
      mask_id = Utilities.mask_id

      @svg = <<~SVG
        <svg
          viewBox="0 0 #{SIZE} #{SIZE}"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          width="#{options[:size]}"
          height="#{options[:size]}"
        >
          <mask id="#{mask_id}" maskUnits="userSpaceOnUse" x="0" y="0" width="#{SIZE}" height="#{SIZE}">
            <rect width="#{SIZE}" height="#{SIZE}" rx="#{options[:square] ? "" : SIZE * 2}" fill="white"></rect>
          </mask>
          <g mask="url(##{mask_id})">
            <path fill="url(#gradient_paint0_linear_#{name})" d="M0 0h80v40H0z"></path>
            <path fill="url(#gradient_paint1_linear_#{name})" d="M0 40h80v40H0z"></path>
          </g>
          <defs>
            <linearGradient
              id="gradient_paint0_linear_#{name}"
              x1="#{SIZE / 2}"
              y1="0"
              x2="#{SIZE / 2}"
              y2="#{SIZE / 2}"
              gradientUnits="userSpaceOnUse"
            >
              <stop stop-color="#{properties[0][:color]}"></stop>
              <stop offset="1" stop-color="#{properties[1][:color]}"></stop>
            </linearGradient>
            <linearGradient
              id="gradient_paint1_linear_#{name}"
              x1="#{SIZE / 2}"
              y1="#{SIZE / 2}"
              x2="#{SIZE / 2}"
              y2="#{SIZE}"
              gradientUnits="userSpaceOnUse"
            >
              <stop stop-color="#{properties[2][:color]}"></stop>
              <stop offset="1" stop-color="#{properties[3][:color]}"></stop>
            </linearGradient>
          </defs>
        </svg>
      SVG
    end

    def generate_colors(name, colors)
      num_from_name = Utilities.get_number(name)
      range = colors&.size

      ELEMENTS.times.map.with_index do |_element, i|
        {
          color: Utilities.get_random_color(num_from_name + i, colors, range)
        }
      end
    end
  end
end
