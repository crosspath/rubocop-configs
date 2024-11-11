# crosspath/rubocop-configs

Config files for Rubocop and its extensions.

Default values commented and presented here for convenience.
Property `Enabled` always presented.

Preferences:
1. Reduce amount of changed lines in diff.
2. Always use consistent indentation (2 spaces per indentation level).
3. Code structure follows its semantics. See Layout/ClassStructure.

Config files will be updated
[in this repository](https://github.com/crosspath/rubocop-configs)
about once a month after updating Rubocop and its extensions.

You may select which config files should be included into your project:

```yaml
# In your .rubocop.yml file:
inherit_gem:
  rubocop-configs:
    - _all_cops.yml
    # _ruby.yml includes:
    #   layout.yml
    #   lint.yml
    #   metrics.yml
    #   migration.yml
    #   naming.yml
    #   security.yml
    #   style.yml
    - _ruby.yml
    - bundler.yml
    - capybara.yml
    - factory_bot.yml
    - gemspec.yml
    - graphql.yml
    - performance.yml
    - rails.yml
    - rake.yml
    - rspec.yml
    - rspec_rails.yml
    - rswag.yml
    - sequel.yml
```

You may override any config values in your .rubocop.yml file, as usual.

Also you have to include gems for Rubocop and its extensions into your Gemfile. Theirs versions should match specified versions in these config files.

And add this gem too:

```ruby
gem "rubocop-configs", require: false, git: "https://github.com/crosspath/rubocop-configs.git"
```

## Usage

Let's take an example! Suppose you're building typical Rails project, you have to do:

1. Prepend this code to `.rubocop.yml`:

  ```yaml
  inherit_gem:
    rubocop-configs:
      - _all_cops.yml
      - _ruby.yml
      - bundler.yml
      - rails.yml
      - rake.yml
  ```

2. Append these gems to `Gemfile`:

  ```ruby
    group :development, optional: true do
      gem "prism" # For parser_prism in Rubocop.
      gem "rubocop", "~> 1.68", require: false
      gem "rubocop-configs", require: false, git: "https://github.com/crosspath/rubocop-configs.git"
      gem "rubocop-rails", "~> 2.27", require: false
      gem "rubocop-rake", "0.6.0", require: false
    end
  ```

If you use `optional` flag in Gemfile, you should enable it in `bundle config`. See more
[here](https://bundler.io/v2.4/man/bundle-config.1.html). In short: run in console
`bundle config set --global with development test` to enable it everywhere in your user profile.

3. Run `bundle install`

Now you're ready to check your code with Rubocop and these config files. Run Rubocop as usual:

```sh
bundle exec rubocop
```

## Supported gems

This repository includes config files for these gems and versions:

* rubocop, 1.68:
  - _all_cops.yml
  - _ruby.yml
  - bundler.yml
  - gemspec.yml
  - layout.yml
  - lint.yml
  - metrics.yml
  - migration.yml
  - naming.yml
  - security.yml
  - style.yml
* rubocop-capybara, 2.21:
  - capybara.yml
* rubocop-factory_bot, 2.26:
  - factory_bot.yml
* rubocop-graphql, 1.5:
  - graphql.yml
* rubocop-performance, 1.21:
  - performance.yml
* rubocop-rails, 2.27:
  - rails.yml
* rubocop-rake, 0.6.0:
  - rake.yml
* rubocop-rspec, 3.2:
  - rspec.yml
* rubocop-rspec_rails, 2.30:
  - rspec_rails.yml
* rubocop-sequel, 0.3.7:
  - sequel.yml
* rubocop-thread_safety, 0.6.0:
  - thread_safety.yml
* rswag-specs, 2.15:
  - rswag.yml

## Ensure versions of config files match to versions of installed gems

You may use rake task to compare gems' versions:

1. Add this stroke of code to `Rakefile` in your project:

  ```ruby
  RubocopConfigs.load_tasks
  ```

2. Run `rake rubocop_configs:versions`

It outputs message `Versions match!` if everything is correct. Otherwise you'll see error.

You may use this task in CI. This task exits with status 1 on error and 0 on success.

Or you may write test:

```ruby
# RSpec syntax
describe RubocopConfigs do
  describe ".check_versions" do
    it "matches versions" do
      errors = RubocopConfigs.check_versions
      expect(errors).to be_empty
    end
  end
end
```

Code above does not check version of gem `rswag-specs`.

## Versioning policy

Change of major version (`1.*.* -> 2.*.*`) means backwards-incompatible changes in the gem code,
that requires changes in your (client) code.

Change of minor version (`*.1.* -> *.2.*`) means backwards-compatible changes in the gem code, that
normally should not require changes in client code.

Change of build/patch version (`*.*.1 -> *.*.2`) means backwards-compatible changes in the gem code,
that do not require changes in client code.

Minor version may be changed due to updating config files to newer version of Rubocop and its
extensions, but not limited to this.

## Development

How to review and update config values?

1. Compare changes in default config files for Rubocop and its extensions. Example link:

    https://github.com/rubocop/rubocop/compare/v1.50.2...master

2. Review changes in file `config/default.yml`
3. Carefully update config files in this repository.
4. Use test project to ensure these config files are OK.
5. Update gem versions in README, config files and rake task.
6. Add Changelog entry.
7. Push changes to the repository and add git tag.

License: MIT.
