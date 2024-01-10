# Changelog

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
