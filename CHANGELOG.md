# Changelog

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
