# Changelog

## 0.18.0

Update config files to:

* RuboCop v1.67.0
* RuboCop RSpec v3.1.0

## 0.17.0

Update config files to:

* RuboCop v1.66.1
* RuboCop Rails v2.26.2

Disable rule `Performance/BlockGivenWithExplicitBlock` because its suggestion does not improve
perfomance (see [discussion](https://github.com/rubocop/rubocop-performance/issues/385)).

## 0.16.1

Changes for developer convenience:

1. Disable rules `Rails/Output` & `Style/TopLevelMethodDefinition` in `db/seeds.rb` file.
2. Set `Max = 4` instead of 3 in `RSpec/NestedGroups` rule. It matches with Swagger tests:
  `path - get - response - run_test!`, 4 levels deep.
3. Disable rule `RSpec/RepeatedExampleGroupBody` in `spec/requests` directory. This change relates
  to Swagger tests.
4. Disable rules `Style/Documentation` & `Style/DocumentationMethod` in directories:
  - config
  - db/migrate

Copy configuration from gem `rswag`.

## 0.16.0

Update config files to:

* RuboCop v1.65.0
* RuboCop RSpec v3.0.3

## 0.15.0

Set `required_ruby_version` in the gem to 3.3+, same as `TargetRubyVersion` in Rubocop.

Support without changes:

* Rubocop Capybara v2.21.0
* RuboCop factory_bot v2.26.1
* RuboCop RSpec Rails v2.30.0

## 0.14.0

Update config files to:

* RuboCop RSpec v2.31.0

## 0.13.0

Update README: suggest to use `gem "prism"` for option `parser_prism` in Rubocop.

Ruleset changes:

* Layout/SpaceAroundEqualsInParameterDefault: change EnforcedStyle from `no_space` to `space`
  (default value in Rubocop).
* Style/MethodCallWithArgsParentheses: add `require` and `require_relative` to AllowedMethods
  (allow to call them without parentheses)
* Style/RequireOrder: add `bin/*` to Exclude (order of `require` lines in bin-scripts are
  significant for running operations)

Update config files to:

* RuboCop v1.64.0
* RuboCop::GraphQL v1.5.1
* RuboCop Rails v2.25.0

Support without changes:

* RuboCop Performance v1.21.0

## 0.12.1

Add TargetRubyVersion = 3.3 (it's required for parser_prism).

## 0.12.0

Update config files to:

* RuboCop v1.63.5
* RuboCop RSpec v2.29.2
* RuboCop RSpec Rails v2.28.3 (extracted from RuboCop RSpec v2.28.0)

## 0.11.0

Update config files to:

* RuboCop RSpec v2.27.1

Support without changes:

* Rubocop v1.62.1
* RuboCop Rails v2.24.0

## 0.10.0

Support without changes:

* Rubocop v1.60.1
* RuboCop Performance v1.20.2

## 0.9.0

Update config files to:

* Rubocop Capybara v2.20.0
* RuboCop factory_bot v2.25.1
* RuboCop RSpec v2.26.1

Support without changes:

* RuboCop::GraphQL v1.5.0

## 0.8.0

Update config files to:

* Rubocop v1.59.0

Support without changes:

* RuboCop Performance v1.20.1
* RuboCop Rails v2.23.1

## 0.7.0

Update config files to:

* Rubocop v1.58.0

## 0.6.0

Update config files to:

* RuboCop Rails v2.22.1

## 0.5.0

Update config files to:

* Rubocop v1.57.1
* RuboCop Capybara v2.19.0
* RuboCop factory_bot v2.24.0
* RuboCop Rails v2.21.2
* RuboCop RSpec v2.24.1

## 0.4.0

Update config files to:

* Rubocop v1.56.2
* RuboCop Performance v1.19.0
* RuboCop RSpec v2.23.2

## 0.3.0

Update config files to:

* Rubocop v1.54.1
* RuboCop::GraphQL v1.3.0
* RuboCop Rails v2.20.2

## 0.2.0

Update config files to:

* Rubocop v1.51.0
* RuboCop factory_bot v2.23.1
* RuboCop::GraphQL v1.2.0

Support without changes:

* RuboCop Performance v1.18.0

## 0.1.4

Fix previous change.

## 0.1.3

More precise gem version checks.

## 0.1.2

1. Added `exclude` entries to `Lint/Debugger`, `Style/ClassAndModuleChildren`,
  `Style/MethodCallWithArgsParentheses`. These rules should not be applied to some files from
  typical Rails projects.
2. Added `inherit_mode` setting for merging `exclude` entries.

## 0.1.1

1. Added gem version ranges.
2. Added code for test case, extracted from rake task.

## 0.1.0

First release. Includes config files and rake task for checking gem versions.
