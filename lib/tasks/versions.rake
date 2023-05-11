# frozen_string_literal: true

namespace :rubocop_configs do
  desc "Compare expected and actual versions of Rubocop and its extensions"
  task :versions do
    require_relative "../rubocop_configs"

    MSG = "Expected %<title>s version %<expected>s, got %<actual>s".freeze

    errors = RubocopConfigs.check_versions

    if errors.empty?
      puts "Versions match!"
      # exit 0 # Success state (default)
    else
      errors.each do |error|
        warn sprintf(MSG, error)
      end
      exit 1
    end
  rescue RuntimeError => e
    warn e.message, e.backtrace
    exit 1 # Error state
  end
end
