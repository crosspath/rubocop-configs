# frozen_string_literal: true

module RubocopConfigs
  VERSION = "0.1.2"

  # WARN: Version ranges work good if min and max values have the same length.
  # ("1.9.0".."1.99.0").cover?("1.10.1") # => false
  GEMS = {
    rubocop: {
      version: "1.50.0".."1.50.2",
      title: "Rubocop",
      const: "RuboCop::Version::STRING"
    }.freeze,
    "rubocop-capybara": {
      version: "2.17.0".."2.18.0",
      title: "Rubocop::Capybara",
      const: "RuboCop::Capybara::Version::STRING"
    }.freeze,
    "rubocop-factory_bot": {
      version: "2.22.0".."2.22.0",
      title: "Rubocop::FactoryBot",
      const: "RuboCop::FactoryBot::Version::STRING"
    }.freeze,
    "rubocop-graphql": {
      version: "1.0.0".."1.2.0",
      title: "Rubocop::GraphQL",
      const: "RuboCop::GraphQL::VERSION"
    }.freeze,
    "rubocop-performance": {
      version: "1.15.0".."1.17.1",
      title: "Rubocop::Performance",
      const: "RuboCop::Performance::Version::STRING"
    }.freeze,
    "rubocop-rails": {
      version: "2.19.0".."2.19.1",
      title: "Rubocop::Rails",
      const: "RuboCop::Rails::Version::STRING"
    }.freeze,
    "rubocop-rake": {
      version: "0.5.0".."0.6.0",
      title: "Rubocop::Rake",
      const: "RuboCop::Rake::VERSION"
    }.freeze,
    "rubocop-rspec": {
      version: "2.20.0".."2.22.0",
      title: "Rubocop::RSpec",
      const: "RuboCop::RSpec::Version::STRING"
    }.freeze,
    "rubocop-sequel": {
      version: "0.3.0".."0.3.4",
      title: "Rubocop::Sequel",
      const: "RuboCop::Sequel::Version::STRING"
    }.freeze,
  }.freeze

  def self.check_gem_version(key)
    gem = GEMS[key]
    expected = gem[:version]
    actual = Object.const_get(gem[:const])

    return if expected.cover?(actual)

    {gem: key, title: gem[:title], expected: expected, actual: actual}
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
