# frozen_string_literal: true

module BoringAvatarsRuby
  class AvatarBauhaus < Avatar
    ELEMENTS = 4
    SIZE     = 80

    def initialize(options = {})
      options    = DEFAULT_OPTIONS.merge(options)
      properties = generate_colors(options[:name], options[:colors])
      mask_id    = Utilities.mask_id

      @svg = <<~SVG
               <svg
          viewBox='0 0 #{SIZE} #{SIZE}'
          fill="none"
          role="img"
          xmlns="http://www.w3.org/2000/svg"
          width='#{options[:size]}'
          height='#{options[:size]}'
        >
          #{options[:title] ? "<title>#{options[:name]}</title>" : nil}
          <mask id='#{mask_id}' maskUnits="userSpaceOnUse" x='0' y='0' width='#{SIZE}' height='#{SIZE}'>
            <rect width='#{SIZE}' height='#{SIZE}' rx='#{options[:square] ? nil : SIZE * 2}' fill="#FFFFFF" />
          </mask>
          <g mask='url(##{mask_id})'>
            <rect width='#{SIZE}' height='#{SIZE}' fill='#{properties[0][:color]}' />
            <rect
              x='#{(SIZE - 60) / 2}'
              y='#{(SIZE - 20) / 2}'
              width='#{SIZE}'
              height='#{properties[1][:is_square] ? SIZE : SIZE / 8}'
              fill='#{properties[1][:color]}'
              transform='translate( #{properties[1][:translate_x]} #{properties[1][:translate_y]}) rotate(#{properties[1][:rotate]} #{SIZE / 2} #{SIZE / 2})'
            />
            <circle
              cx='#{SIZE / 2}'
              cy='#{SIZE / 2}'
              fill='#{properties[2][:color]}'
              r='#{SIZE / 5}'
              transform='translate( #{properties[2][:translate_x]} #{properties[2][:translate_y]} )'
            />
            <line
              x1='0'
              y1='#{SIZE / 2}'
              x2='#{SIZE}'
              y2='#{SIZE / 2}'
              strokeWidth='2'
              stroke='#{properties[3][:color]}'
              transform='translate(#{properties[3][:translate_x]} #{properties[3][:translate_y]}) rotate(#{properties[3][:rotate]} #{SIZE / 2} #{SIZE / 2})'
            />
          </g>
        </svg>
      SVG
    end

    def generate_colors(name, colors)
      num_from_name = Utilities.get_number(name)
      range         = colors&.size

      ELEMENTS.times.map.with_index do |_element, i|
        {
          color:       Utilities.get_random_color(num_from_name + i, colors, range),
          translate_x: Utilities.get_unit(num_from_name * (i + 1), SIZE / 2 - (i + 17), 1),
          translate_y: Utilities.get_unit(num_from_name * (i + 1), SIZE / 2 - (i + 17), 2),
          rotate:      Utilities.get_unit(num_from_name * (i + 1), 360),
          is_square:   Utilities.get_boolean(num_from_name, 2)
        }
      end
    end
  end
end
