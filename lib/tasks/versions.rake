# frozen_string_literal: true

namespace :rubocop_configs do
  desc "Compare expected and actual versions of Rubocop and its extensions"
  task :versions do
    require "rubocop"
    require_relative "../rubocop_configs"

    # We don't need config values. We should call `for_pwd` to read config files for Rubocop,
    # including `.rubocop.yml` in project root path.
    RuboCop::ConfigStore.new.for_pwd

    extensions = RuboCop::ConfigLoader.loaded_features
    # => #<Set: {"rubocop-rails", "rubocop-rspec", "rubocop-performance"}>

    RubocopConfigs.check_gem_version(:rubocop)

    extensions.each do |gem_name|
      RubocopConfigs.check_gem_version(gem_name.to_sym)
    end

    puts "Versions match!"
    # exit 0 # Success state (default)
  rescue RuntimeError => e
    warn e.message, e.backtrace
    exit 1 # Error state
  end
end
