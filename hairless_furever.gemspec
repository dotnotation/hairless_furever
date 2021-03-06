# frozen_string_literal: true

require_relative "lib/hairless_furever/version"

Gem::Specification.new do |spec|
  spec.name          = "hairless_furever"
  spec.version       = HairlessFurever::VERSION
  spec.authors       = ["dotnotation"]
  spec.email         = ["dotinmotionproductions@gmail.com"]

  spec.summary       = "Find out about hairless dogs."
  spec.description   = "Using a CLI find out about the different attributes of hairless dogs"
  spec.homepage      = "https://github.com/dotnotation/hairless_furever"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dotnotation/hairless_furever"
  spec.metadata["changelog_uri"] = "https://github.com/dotnotation/hairless_furever"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "nokogiri"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
