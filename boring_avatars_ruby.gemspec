# frozen_string_literal: true

require_relative "lib/boring_avatars_ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "boring_avatars_ruby"
  spec.version       = BoringAvatarsRuby::VERSION
  spec.authors       = ["Chris Branson"]
  spec.email         = ["138595+chrisbranson@users.noreply.github.com"]

  spec.summary       = "Boring Avatars Ruby is a Ruby implementation of Boring Avatars by boringdesigners."
  spec.description   = <<-EOT
    Boring Avatars Ruby is a Ruby implementation of Boring Avatars by boringdesigners.
    
    It generates SVG based avatars from any username and color palette in a variety of forms.
  EOT
  
  spec.homepage      = "https://github.com/CircleSD/boring_avatars_ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/CircleSD/boring_avatars_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/CircleSD/boring-avatars-ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features|tmp|bin)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
