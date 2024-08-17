# frozen_string_literal: true

module BoringAvatarsRuby
  class AvatarMarble < Avatar
    ELEMENTS = 3
    SIZE = 80

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
            <rect width="#{SIZE}" height="#{SIZE}" rx="2" fill="#{properties[0][:color]}"></rect>
            <path
              filter="url(#prefix__filter0_f)"
              d="M32.414 59.35L50.376 70.5H72.5v-71H33.728L26.5 13.381l19.057 27.08L32.414 59.35z"
              fill="#{properties[1][:color]}"
              transform="translate(#{properties[1][:translate_x]} #{properties[1][:translate_y]}) rotate(#{properties[1][:rotate]} #{SIZE / 2} #{SIZE / 2}) scale(#{properties[2][:scale]})">
            </path>
            <path
              filter="url(#prefix__filter0_f)"
              style="mix-blend-mode:overlay"
              d="M22.216 24L0 46.75l14.108 38.129L78 86l-3.081-59.276-22.378 4.005 12.972 20.186-23.35 27.395L22.215 24z"
              fill="#{properties[2][:color]}"
              transform="translate(#{properties[2][:translate_x]} #{properties[2][:translate_y]}) rotate(#{properties[2][:rotate]} #{SIZE / 2} #{SIZE / 2}) scale(#{properties[2][:scale]})">
            </path>
          </g>
          <defs>
            <filter
              id="prefix__filter0_f"
              filterUnits="userSpaceOnUse"
              color-interpolation-filters="sRGB"
            >
              <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
              <feBlend in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend>
              <feGaussianBlur stdDeviation="7" result="effect1_foregroundBlur"></feGaussianBlur>
            </filter>
          </defs>
        </svg>
      SVG
    end

    def generate_colors(name, colors)
      num_from_name = Utilities.get_number(name)
      range = colors&.size

      ELEMENTS.times.map.with_index do |_element, i|
        {
          color: Utilities.get_random_color(num_from_name + i, colors, range),
          translate_x: Utilities.get_unit(num_from_name * (i + 1), SIZE / 10, 1),
          translate_y: Utilities.get_unit(num_from_name * (i + 1), SIZE / 10, 2),
          scale: 1.2 + Utilities.get_unit(num_from_name * (i + 1), SIZE / 20) / 10,
          rotate: Utilities.get_unit(num_from_name * (i + 1), 360, 1)
        }
      end
    end
  end
end
