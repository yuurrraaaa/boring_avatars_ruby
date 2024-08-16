# frozen_string_literal: true

module BoringAvatarsRuby
  class AvatarBeam < Avatar
    SIZE = 36

    def initialize(options = {})
      options    = DEFAULT_OPTIONS.merge(options)
      properties = generate_colors(options[:name], options[:colors])
      mask_id    = 'm123'

      @svg = <<~SVG
            <svg
          viewBox='0 0 #{SIZE} #{SIZE}'
          fill="none"
          role="img"
          xmlns="http://www.w3.org/2000/svg"
          width="#{options[:size]}"
          height="#{options[:size]}"
        >
          #{options[:title] ? "<title>#{options[:name]}</title>" : nil}
          <mask id="#{mask_id}" maskUnits="userSpaceOnUse" x="0" y="0" width="#{SIZE}" height="#{SIZE}">
            <rect width="#{SIZE}" height="#{SIZE}" rx="#{options[:square] ? nil : SIZE * 2}" fill="#FFFFFF" />
          </mask>
          <g mask="url(##{mask_id})">
            <rect width="#{SIZE}" height="#{SIZE}" fill="#{properties[:background_color]}" />
            <rect
              x="0"
              y="0"
              width="#{SIZE}"
              height="#{SIZE}"
              transform="translate(#{properties[:wrapper_translate_x]} #{properties[:wrapper_translate_y]}) rotate(#{properties[:wrapper_rotate]} #{SIZE / 2} #{SIZE / 2}) scale(#{properties[:wrapper_scale]})"
              fill="#{properties[:wrapper_color]}"
              rx="#{properties[:is_circle] ? SIZE : SIZE / 6}"
            />
            <g transform="translate(#{properties[:face_translate_x]} #{properties[:face_translate_y]}) rotate(#{properties[:face_rotate]} #{SIZE / 2} #{SIZE / 2})">
              #{properties[:is_mouth_open] ? "
                <path
                  d='#{'M15 ' + "#{19 + properties[:mouth_spread]}" + 'c2 1 4 1 6 0'}'
                  stroke='#{properties[:face_color]}'
                  fill='none'
                  strokeLinecap='round'
                />
              " : "
                <path
                  d='#{'M13,' + "#{19 + properties[:mouth_spread]}" + ' a1,0.75 0 0,0 10,0'}'
                  fill='#{properties[:face_color]}'
                />
              "}
              <rect
                x="#{14 - properties[:eye_spread]}"
                y='14'
                width='1.5'
                height='2'
                rx='1'
                stroke="none"
                fill="#{properties[:face_color]}"
              />
              <rect
                x="#{20 + properties[:eye_spread]}"
                y='14'
                width='1.5'
                height='2'
                rx='1'
                stroke="none"
                fill="#{properties[:face_color]}"
              />
            </g>
          </g>
        </svg>
      SVG
    end

    def generate_colors(name, colors)
      num_from_name       = Utilities.get_number(name)
      range               = colors&.size
      wrapper_color       = Utilities.get_random_color(num_from_name, colors, range)
      pre_translate_x     = Utilities.get_unit(num_from_name, 10, 1)
      wrapper_translate_x = pre_translate_x < 5 ? (pre_translate_x + SIZE / 9) : pre_translate_x
      pre_translate_y     = Utilities.get_unit(num_from_name, 10, 2)
      wrapper_translate_y = pre_translate_y < 5 ? (pre_translate_y + SIZE / 9) : pre_translate_y
      {
        wrapper_color:       wrapper_color,
        face_color:          Utilities.get_contrast(wrapper_color),
        background_color:    Utilities.get_random_color(num_from_name + 13, colors, range),
        wrapper_translate_x: wrapper_translate_x,
        wrapper_translate_y: wrapper_translate_y,
        wrapper_rotate:      Utilities.get_unit(num_from_name, 360),
        wrapper_scale:       1 + Utilities.get_unit(num_from_name, SIZE / 12) / 10,
        is_mouth_open:       Utilities.get_boolean(num_from_name, 2),
        is_circle:           Utilities.get_boolean(num_from_name, 1),
        eye_spread:          Utilities.get_unit(num_from_name, 5),
        mouth_spread:        Utilities.get_unit(num_from_name, 3),
        face_rotate:         Utilities.get_unit(num_from_name, 10, 3),
        face_translate_x:    wrapper_translate_x > SIZE / 6 ? wrapper_translate_x / 2 : Utilities.get_unit(num_from_name, 8, 1),
        face_translate_y:    wrapper_translate_y > SIZE / 6 ? wrapper_translate_y / 2 : Utilities.get_unit(num_from_name, 7, 2),
      }
    end
  end
end
