# frozen_string_literal: true

module BoringAvatarsRuby
  class AvatarPixel < Avatar
    ELEMENTS = 64
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
          <mask
            id="#{mask_id}"
            mask-type="alpha"
            maskUnits="userSpaceOnUse"
            x="0"
            y="0"
            width="#{SIZE}"
            height="#{SIZE}"
          >
            <rect width="#{SIZE}" height="#{SIZE}" rx="#{options[:square] ? "" : SIZE * 2}" fill="white"></rect>
          </mask>
          <g mask="url(##{mask_id})">
            <rect width="10" height="10" fill="#{properties[0][:color]}"></rect>
            <rect x="20" width="10" height="10" fill="#{properties[1][:color]}"></rect>
            <rect x="40" width="10" height="10" fill="#{properties[2][:color]}"></rect>
            <rect x="60" width="10" height="10" fill="#{properties[3][:color]}"></rect>
            <rect x="10" width="10" height="10" fill="#{properties[4][:color]}"></rect>
            <rect x="30" width="10" height="10" fill="#{properties[5][:color]}"></rect>
            <rect x="50" width="10" height="10" fill="#{properties[6][:color]}"></rect>
            <rect x="70" width="10" height="10" fill="#{properties[7][:color]}"></rect>
            <rect y="10" width="10" height="10" fill="#{properties[8][:color]}"></rect>
            <rect y="20" width="10" height="10" fill="#{properties[9][:color]}"></rect>
            <rect y="30" width="10" height="10" fill="#{properties[10][:color]}"></rect>
            <rect y="40" width="10" height="10" fill="#{properties[11][:color]}"></rect>
            <rect y="50" width="10" height="10" fill="#{properties[12][:color]}"></rect>
            <rect y="60" width="10" height="10" fill="#{properties[13][:color]}"></rect>
            <rect y="70" width="10" height="10" fill="#{properties[14][:color]}"></rect>
            <rect x="20" y="10" width="10" height="10" fill="#{properties[15][:color]}"></rect>
            <rect x="20" y="20" width="10" height="10" fill="#{properties[16][:color]}"></rect>
            <rect x="20" y="30" width="10" height="10" fill="#{properties[17][:color]}"></rect>
            <rect x="20" y="40" width="10" height="10" fill="#{properties[18][:color]}"></rect>
            <rect x="20" y="50" width="10" height="10" fill="#{properties[19][:color]}"></rect>
            <rect x="20" y="60" width="10" height="10" fill="#{properties[20][:color]}"></rect>
            <rect x="20" y="70" width="10" height="10" fill="#{properties[21][:color]}"></rect>
            <rect x="40" y="10" width="10" height="10" fill="#{properties[22][:color]}"></rect>
            <rect x="40" y="20" width="10" height="10" fill="#{properties[23][:color]}"></rect>
            <rect x="40" y="30" width="10" height="10" fill="#{properties[24][:color]}"></rect>
            <rect x="40" y="40" width="10" height="10" fill="#{properties[25][:color]}"></rect>
            <rect x="40" y="50" width="10" height="10" fill="#{properties[26][:color]}"></rect>
            <rect x="40" y="60" width="10" height="10" fill="#{properties[27][:color]}"></rect>
            <rect x="40" y="70" width="10" height="10" fill="#{properties[28][:color]}"></rect>
            <rect x="60" y="10" width="10" height="10" fill="#{properties[29][:color]}"></rect>
            <rect x="60" y="20" width="10" height="10" fill="#{properties[30][:color]}"></rect>
            <rect x="60" y="30" width="10" height="10" fill="#{properties[31][:color]}"></rect>
            <rect x="60" y="40" width="10" height="10" fill="#{properties[32][:color]}"></rect>
            <rect x="60" y="50" width="10" height="10" fill="#{properties[33][:color]}"></rect>
            <rect x="60" y="60" width="10" height="10" fill="#{properties[34][:color]}"></rect>
            <rect x="60" y="70" width="10" height="10" fill="#{properties[35][:color]}"></rect>
            <rect x="10" y="10" width="10" height="10" fill="#{properties[36][:color]}"></rect>
            <rect x="10" y="20" width="10" height="10" fill="#{properties[37][:color]}"></rect>
            <rect x="10" y="30" width="10" height="10" fill="#{properties[38][:color]}"></rect>
            <rect x="10" y="40" width="10" height="10" fill="#{properties[39][:color]}"></rect>
            <rect x="10" y="50" width="10" height="10" fill="#{properties[40][:color]}"></rect>
            <rect x="10" y="60" width="10" height="10" fill="#{properties[41][:color]}"></rect>
            <rect x="10" y="70" width="10" height="10" fill="#{properties[42][:color]}"></rect>
            <rect x="30" y="10" width="10" height="10" fill="#{properties[43][:color]}"></rect>
            <rect x="30" y="20" width="10" height="10" fill="#{properties[44][:color]}"></rect>
            <rect x="30" y="30" width="10" height="10" fill="#{properties[45][:color]}"></rect>
            <rect x="30" y="40" width="10" height="10" fill="#{properties[46][:color]}"></rect>
            <rect x="30" y="50" width="10" height="10" fill="#{properties[47][:color]}"></rect>
            <rect x="30" y="60" width="10" height="10" fill="#{properties[48][:color]}"></rect>
            <rect x="30" y="70" width="10" height="10" fill="#{properties[49][:color]}"></rect>
            <rect x="50" y="10" width="10" height="10" fill="#{properties[50][:color]}"></rect>
            <rect x="50" y="20" width="10" height="10" fill="#{properties[51][:color]}"></rect>
            <rect x="50" y="30" width="10" height="10" fill="#{properties[52][:color]}"></rect>
            <rect x="50" y="40" width="10" height="10" fill="#{properties[53][:color]}"></rect>
            <rect x="50" y="50" width="10" height="10" fill="#{properties[54][:color]}"></rect>
            <rect x="50" y="60" width="10" height="10" fill="#{properties[55][:color]}"></rect>
            <rect x="50" y="70" width="10" height="10" fill="#{properties[56][:color]}"></rect>
            <rect x="70" y="10" width="10" height="10" fill="#{properties[57][:color]}"></rect>
            <rect x="70" y="20" width="10" height="10" fill="#{properties[58][:color]}"></rect>
            <rect x="70" y="30" width="10" height="10" fill="#{properties[59][:color]}"></rect>
            <rect x="70" y="40" width="10" height="10" fill="#{properties[60][:color]}"></rect>
            <rect x="70" y="50" width="10" height="10" fill="#{properties[61][:color]}"></rect>
            <rect x="70" y="60" width="10" height="10" fill="#{properties[62][:color]}"></rect>
            <rect x="70" y="70" width="10" height="10" fill="#{properties[63][:color]}"></rect>
          </g>
        </svg>
      SVG
    end

    def generate_colors(name, colors)
      num_from_name = Utilities.get_number(name)
      range = colors&.size

      ELEMENTS.times.map.with_index do |_element, i|
        {
          color: Utilities.get_random_color(num_from_name % (i + 13), colors, range)
        }
      end
    end
  end
end
