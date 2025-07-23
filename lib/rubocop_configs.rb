# frozen_string_literal: true

module RubocopConfigs
  VERSION = "0.31.0"

  GEMS = {
    rubocop: {
      version: ["1.78", "1.79"],
      title: "Rubocop",
      const: "RuboCop::Version::STRING"
    }.freeze,
    "rubocop-capybara": {
      version: ["2.22", "2.23"],
      title: "Rubocop::Capybara",
      const: "RuboCop::Capybara::Version::STRING"
    }.freeze,
    "rubocop-factory_bot": {
      version: ["2.27", "2.28"],
      title: "Rubocop::FactoryBot",
      const: "RuboCop::FactoryBot::Version::STRING"
    }.freeze,
    "rubocop-graphql": {
      version: ["1.3", "1.6"],
      title: "Rubocop::GraphQL",
      const: "RuboCop::GraphQL::VERSION"
    }.freeze,
    "rubocop-performance": {
      version: ["1.24", "1.26"],
      title: "Rubocop::Performance",
      const: "RuboCop::Performance::Version::STRING"
    }.freeze,
    "rubocop-rails": {
      version: ["2.29", "2.33"],
      title: "Rubocop::Rails",
      const: "RuboCop::Rails::Version::STRING"
    }.freeze,
    "rubocop-rake": {
      version: ["0.5", "0.8"],
      title: "Rubocop::Rake",
      const: "RuboCop::Rake::VERSION"
    }.freeze,
    "rubocop-rspec": {
      version: ["3.6", "3.7"],
      title: "Rubocop::RSpec",
      const: "RuboCop::RSpec::Version::STRING"
    }.freeze,
    "rubocop-rspec_rails": {
      version: ["2.31", "2.32"],
      title: "Rubocop::RSpecRails",
      const: "RuboCop::RSpecRails::Version::STRING"
    }.freeze,
    "rubocop-sequel": {
      version: ["0.4", "0.5"],
      title: "Rubocop::Sequel",
      const: "RuboCop::Sequel::Version::STRING"
    }.freeze,
    "rubocop-thread_safety": {
      version: ["0.7", "1.0"],
      title: "Rubocop::ThreadSafety",
      const: "RuboCop::ThreadSafety::VERSION"
    }.freeze,
  }.freeze

  def self.check_gem_version(key)
    gem = GEMS[key]
    range = gem[:version]
    min = Gem::Version.create(range[0])
    max = Gem::Version.create(range[1])
    actual = Gem::Version.create(Object.const_get(gem[:const]))

    # Version satisfies the range excluding `range.max`-pre versions.
    return if min <= actual && actual < max && !(max == actual && actual.prerelease?)

    {gem: key, title: gem[:title], expected: range, actual: actual}
  end

  def self.check_versions
    require "rubocop"

    # We don't need config values. We should call `for_pwd` to read config files for Rubocop,
    # including `.rubocop.yml` in project root path.
    RuboCop::ConfigStore.new.for_pwd

    extensions = RuboCop::ConfigLoader.loaded_features
    # => #<Set: {"rubocop-rails", "rubocop-rspec", "rubocop-performance"}>

    gems = [:rubocop] + extensions.map(&:to_sym)
    errors = []

    gems.each do |gem_name|
      error = RubocopConfigs.check_gem_version(gem_name)
      errors << error if error
    end

    errors
  end

  def self.load_tasks
    load "#{__dir__}/tasks/versions.rake"
  end
end
