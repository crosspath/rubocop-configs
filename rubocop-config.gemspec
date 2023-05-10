# frozen_string_literal: true

require_relative "lib/rubocop_configs"

Gem::Specification.new do |spec|
  spec.name = "rubocop-configs"
  spec.version = RubocopConfigs::VERSION
  spec.authors = ["Evgeniy Nochevnov"]

  spec.summary = "Config files for Rubocop and its extensions."
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/crosspath/rubocop-configs"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:\.git)})
    end
  end

  spec.require_paths = ["lib"]

  spec.add_dependency "rake", ">= 13.0"
end
