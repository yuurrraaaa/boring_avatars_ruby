# frozen_string_literal: true

module BoringAvatarsRuby
  class Avatar
    attr_reader :svg

    # the default options used when creating Avatars
    #
    # colors:     (String, Array) An array of hex RGB colors used when generating the avatar, e.g. ["#112233", "#334455", "#556677", "#778899"]
    # name:       (String) Used to make the avatar unique, typically this is a user name
    # size:       (Integer, default 35) the size in pixels of the avatar (used for width and height)
    # square:     (Boolean, default false) Make the avatar square rather than round?
    # variant:    (Symbol, default :marble) The Avatar variant you would like: - :identicon, :marble, :pixel, :ring or :sunset
    #
    # options only used by the :identicon variant: -
    #
    # background_color: (Integer, default 0) the background color of the identicon in rgba notation (e.g. xffffffff for white)
    # border_size:      (Integer, default 35) the size in pixels to leave as an empty border around the identicon image
    # grid_size:        (Integer, default 7)  the number of rows and columns in the identicon, minimum 4, maximum 9
    # square_size:      (Integer, default 50) the size in pixels of each square that makes up the identicon
    # key:              (String) a 16 byte key used by siphash when calculating the hash value (see note below)
    #
    # varying the key ensures uniqueness of an identicon for a given title, it is assumed desirable for different applications
    # to use a different key.
    #
    DEFAULT_OPTIONS = {
      colors: ["#92A1C6", "#146A7C", "#F0AB3D", "#C271B4", "#C20D90"],
      name: "Grace Hopper",
      size: 40,
      square: false,
      variant: :marble,
      background_color: :transparent,
      border_size: 35,
      grid_size: 7,
      square_size: 50,
      key: "\x00\x11\x22\x33\x44\x55\x66\x77\x88\x99\xAA\xBB\xCC\xDD\xEE\xFF"
    }

    VARIANTS = [:identicon, :marble, :pixel, :ring, :sunset, :beam, :bauhaus]

    def save(filename)
      File.open(filename, "wb") { |f| f.write(@svg) }
    end

    def self.create(options = {})
      options[:variant] = validate_variant(options[:variant])
      Object.const_get("BoringAvatarsRuby::Avatar#{options[:variant].capitalize}").new(options)
    end

    def self.validate_variant(variant)
      VARIANTS.any?(variant) ? variant : :marble
    end
  end
end
