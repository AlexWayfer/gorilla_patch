# Changelog

## Unreleased

## 4.0.0 (2020-06-06)

*   Replace `inflecto` with `dry-inflector` (`.from_dry_inflector`)
*   Drop unsupported Ruby 2.3 version
*   Remove `GorillaPatch::Transform` (its methods in stdlib of Ruby >= 2.4)
*   Improve dependencies versions locks
*   Improve code style via new RuboCop cops
*   Write more documentation
*   Create LICENSE file

## 3.2.1 (2019-10-08)

*   Fix `CHANGELOG` updating in `rake release` task
*   Add `FAQ`, `SEO` and `UTM` to default acronyms for `Inflections`

## 3.2.0 (2019-10-07)

*   Add `Object#blank?`
*   Add `Module#module_parent_name` and `Module#module_parent`

## 3.0.1 (2018-07-10)

*   Change `Hash#deep_merge` to do `#deep_dup` for nested objects duplicating

## 3.0.0 (2018-05-15)

*   Add acronyms for `GorillaPatch::Inflections` (#3)
*   Rename `gorilla-patch` to `gorilla_patch`
*   Drop Ruby 2.1 and 2.2 support
*   Add CHANGELOG (yay!)

## 2.9.1 (2018-03-26)

*   Fix `GorillaPatch::Blank` for `Range` (or another `Enumerable`) inside Array or Hash

## 2.9.0 (2018-01-20)

*   Add `nils` option for `Hash#slice*` methods

## 2.8.0 (2018-01-17)

*   Add `[Array, Hash]#nilify_blank_strings{,!}` in `GorillaPatch::Blank`

## 2.7.0 (2017-12-26)

*   Add Ruby 2.5 support

## 2.6.0 (2017-11-11)

*   Add `Delegator#deep_dup` (for `Tempfile` and others) in `GorillaPatch::DeepDup`

## 2.5.1 (2017-09-08)

*   Return `super` from `Hash#transform_values!` if defined

## 2.5.0 (2017-09-08)

*   Add `GorillaPatch::Transform` with `Hash#transform_values{,!}`

## 2.4.3 (2017-09-08)

*   Fix bug (come from `ActiveSupport`) with `Hash#deep_merge!`

## 2.4.2 (2017-09-08)

*   Revert dynamic defining `GorillaPatch::Namespace` methods for `Module`

## 2.4.1 (2017-09-08)

*   Fix `GorillaPatch::Namespace` methods for Modules without names (`Module.new` or `Class.new`)

## 2.4.0 (2017-08-10)

*   Add `[String, Module]#deconstantize` method in `GorillaPatch::Namespace`

## 2.3.1 (2017-08-10)

*   Fix bug with `Class#demodulize` if class was patched with private method

## 2.3.0 (2017-07-25)

*   Add `GorillaPatch::DigEmpty` for `Hash#dig` without arguments

## 2.2.1 (2017-07-23)

*   Add `GorillaPatch::DeepMerge` module with `Hash#deep_merge{,!}` methods

## 2.1.1 (2017-01-25)

*   Add `NilClass#blank?` method in `GorillaPatch::Blank`

## 2.1.0 (2017-01-19)

*   Add `GorillaPatch::Truncate` with `String#truncate`

## 2.0.0 (2017-01-13)

*   Merge `GorillaPatch::LettersCase` and `GorillaPatch::Quantity` into `GorillaPatch::Inflections`
*   Add `GorillaPatch::Inflections.from_inflecto` (`inflecto-refinements` gem)
*   Rename `GorillaPatch::Include` to `GorillaPatch::Cover`
*   Return `Hash` after `Hash#compact!`
*   Add specs for all modules

## 1.0.2 (2016-12-29)

*   Fix `String#camelize` method for camelized strings

## 1.0.1 (2016-11-10)

*   Fix issue with `[Array, Hash]#reject_blank_strings{,!}`

## 1.0.0 (2016-11-10)

*   Rename `GorillaPatch` modules from "which class refined" to "what it does"
