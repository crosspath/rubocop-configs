# Changelog

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
