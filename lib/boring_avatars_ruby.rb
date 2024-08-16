# frozen_string_literal: true

require "siphash"
require_relative "boring_avatars_ruby/version"
require_relative "boring_avatars_ruby/utilities"
require_relative "boring_avatars_ruby/avatar"
require_relative "boring_avatars_ruby/avatar_identicon"
require_relative "boring_avatars_ruby/avatar_marble"
require_relative "boring_avatars_ruby/avatar_pixel"
require_relative "boring_avatars_ruby/avatar_ring"
require_relative "boring_avatars_ruby/avatar_sunset"
require_relative "boring_avatars_ruby/avatar_beam"
require_relative "boring_avatars_ruby/avatar_bauhaus"

module BoringAvatarsRuby
  class Error < StandardError; end
end
