# Gorilla Patch

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/gorilla_patch?style=flat-square)](https://cirrus-ci.com/github/AlexWayfer/gorilla_patch)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/gorilla_patch/master.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/gorilla_patch)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/AlexWayfer/gorilla_patch.svg?style=flat-square)](https://codeclimate.com/github/AlexWayfer/gorilla_patch)
[![Depfu](https://img.shields.io/depfu/AlexWayfer/gorilla_patch?style=flat-square)](https://depfu.com/repos/github/AlexWayfer/gorilla_patch)
[![Inline docs](https://inch-ci.org/github/AlexWayfer/gorilla_patch.svg?branch=master)](https://inch-ci.org/github/AlexWayfer/gorilla_patch)
[![license](https://img.shields.io/github/license/AlexWayfer/gorilla_patch.svg?style=flat-square)](https://github.com/AlexWayfer/gorilla_patch/blob/master/LICENSE.txt)
[![Gem](https://img.shields.io/gem/v/gorilla_patch.svg?style=flat-square)](https://rubygems.org/gems/gorilla_patch)

Ruby Gem for refine Ruby Core classes (like [Monkey patch](https://en.wikipedia.org/wiki/Monkey_patch)).

# Installation

```bash
$ gem install gorilla_patch
```

or with `bundler`:

```ruby
# Gemfile
gem 'gorilla_patch'
```

# Usage

```ruby
require 'gorilla_patch' # or 'gorilla_patch/keys' for specific functionallity

hash = { a: 1, b: 2 }

hash.keys? :a, :b # undefined method!

module Foo
  using GorillaPatch::Keys

  hash.keys? :a, :b # true
end

hash.keys? :a, :b # undefined method!
```

## What is `using`?

[It's standard feature](http://ruby-doc.org/core/doc/syntax/refinements_rdoc.html).

# Methods

*   **Blank**

    *   **`String`**, **`NilClass`**

        *   `#blank?`

    *   **`Array`**, **`Hash`**

        *   `#reject_blank_strings`

        *   `#reject_blank_strings!`

        *   `#nilify_blank_strings`

        *   `#nilify_blank_strings!`

*   **Compact**

    *   **`Hash`**

        *   `#compact`

        *   `#compact!`

*   **Cover**

    *   **`Range`**

        *   `#cover?(value)`

*   **DeepDup**

    *   **`Object`**, **`Hash`**, **`Array`**, **`Delegator`**

        *   `#deep_dup`

*   **DeepMerge**

    *   **`Hash`**

        *   `#deep_merge(other_hash, &block)`

        *   `#deep_merge!(other_hash, &block)`

*   **DigEmpty**

    *   **`Hash`**

        *   `#dig()`

*   **Except**

    *   **`Hash`**

        *   `#except(*)`

        *   `#except!(*)`

*   **Inflections**

    * `.acronyms`

    * `.from_sequel`

    * `.from_inflecto`

    *   **`String`**, **`Module`**

        *   `#underscore`

    *   **`String`**

        *   `#camelize`

*   **Keys**

    *   **`Hash`**

        *   `#keys?(*)`

*   **ModuleParent**
    *   **`Module`**

        *   `#module_parent_name`

        *   `#module_parent`

*   **Namespace**
    *   **`String`**, **`Module`**, **`Class`**

        *   `#demodulize`

        *   `#deconstantize`

*   **Slice**

    *   **`Hash`**

        *   `#slice(*, nils: false)`

        *   `#slice!(*, nils: false)`

        *   `#slice_reverse!(*, nils: false)`

*   **Symbolize**

    *   **`Hash`**

        *   `#symbolize_keys(deep: false)`

        *   `#symbolize_keys!(deep: false)`

*   **Truncate**

    *   **`String`**

        *   `#truncate(position, separator: '', omission: '...')`

# Testing

```
$ rake spec
```

## Development

After checking out the repo, run `bundle install` to install dependencies.

Then, run `toys rspec` to run the tests.

To install this gem onto your local machine, run `toys gem install`.

To release a new version, run `toys gem release %version%`.
See how it works [here](https://github.com/AlexWayfer/gem_toys#release).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/gorilla_patch).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
