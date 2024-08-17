# frozen_string_literal: true

module BoringAvatarsRuby
  class AvatarRing < Avatar
    ELEMENTS = 5
    SIZE = 90

    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)
      properties = generate_colors(options[:name], options[:colors])
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
            <path d="M0 0h90v45H0z" fill="#{properties[0][:color]}"></path>
            <path d="M0 45h90v45H0z" fill="#{properties[1][:color]}"></path>
            <path d="M83 45a38 38 0 00-76 0h76z" fill="#{properties[2][:color]}"></path>
            <path d="M83 45a38 38 0 01-76 0h76z" fill="#{properties[3][:color]}"></path>
            <path d="M77 45a32 32 0 10-64 0h64z" fill="#{properties[4][:color]}"></path>
            <path d="M77 45a32 32 0 11-64 0h64z" fill="#{properties[5][:color]}"></path>
            <path d="M71 45a26 26 0 00-52 0h52z" fill="#{properties[6][:color]}"></path>
            <path d="M71 45a26 26 0 01-52 0h52z" fill="#{properties[7][:color]}"></path>
            <circle cx="45" cy="45" r="23" fill="#{properties[8][:color]}"></circle>
          </g>
        </svg>
      SVG
    end

    def generate_colors(name, colors)
      num_from_name = Utilities.get_number(name)
      range = colors&.size

      colors_shuffle = ELEMENTS.times.map.with_index do |element, i|
        {
          color: Utilities.get_random_color(num_from_name + (i + 1), colors, range)
        }
      end

      [
        colors_shuffle[0],
        colors_shuffle[1],
        colors_shuffle[1],
        colors_shuffle[2],
        colors_shuffle[2],
        colors_shuffle[3],
        colors_shuffle[3],
        colors_shuffle[0],
        colors_shuffle[4]
      ]
    end
  end
end
