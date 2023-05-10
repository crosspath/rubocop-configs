# frozen_string_literal: true

module RubocopConfigs
  class UnsupportedGemVersion < RuntimeError
    MSG = "Expected %<title>s version %<expected>s, got %<actual>s".freeze

    def initialize(title:, expected:, actual:, **)
      super(sprintf(MSG, title: title, expected: expected, actual: actual))
    end
  end

  VERSION = "0.1.0"

  GEMS = {
    rubocop: {
      version: "1.50.2",
      title: "Rubocop",
      const: "RuboCop::Version::STRING"
    }.freeze,
    "rubocop-capybara": {
      version: "2.18.0",
      title: "Rubocop::Capybara",
      const: "RuboCop::Capybara::Version::STRING"
    }.freeze,
    "rubocop-factory_bot": {
      version: "2.22.0",
      title: "Rubocop::FactoryBot",
      const: "RuboCop::FactoryBot::Version::STRING"
    }.freeze,
    "rubocop-graphql": {
      version: "1.1.1",
      title: "Rubocop::GraphQL",
      const: "RuboCop::GraphQL::VERSION"
    }.freeze,
    "rubocop-performance": {
      version: "1.17.0",
      title: "Rubocop::Performance",
      const: "RuboCop::Performance::Version::STRING"
    }.freeze,
    "rubocop-rails": {
      version: "2.19.1",
      title: "Rubocop::Rails",
      const: "RuboCop::Rails::Version::STRING"
    }.freeze,
    "rubocop-rake": {
      version: "0.6.0",
      title: "Rubocop::Rake",
      const: "RuboCop::Rake::VERSION"
    }.freeze,
    "rubocop-rspec": {
      version: "2.22.0",
      title: "Rubocop::RSpec",
      const: "RuboCop::RSpec::Version::STRING"
    }.freeze,
    "rubocop-sequel": {
      version: "0.3.4",
      title: "Rubocop::Sequel",
      const: "RuboCop::Sequel::Version::STRING"
    }.freeze,
  }.freeze

  def self.check_gem_version(key)
    gem = GEMS[key]
    expected = gem[:version]
    actual = Object.const_get(gem[:const])

    unless actual == expected
      raise UnsupportedGemVersion.new(title: gem[:title], expected: expected, actual: actual)
    end
  end

  def self.load_tasks
    load "#{__dir__}/tasks/versions.rake"
  end
end
