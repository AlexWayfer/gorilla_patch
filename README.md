# Gorilla Patch

Ruby Gem for refine Ruby Core classes (like [Monkey patch](https://en.wikipedia.org/wiki/Monkey_patch))

[![Gem Version](https://badge.fury.io/rb/gorilla_patch.svg)](https://badge.fury.io/rb/gorilla_patch)
[![Build Status](https://travis-ci.org/AlexWayfer/gorilla_patch.svg?branch=master)](https://travis-ci.org/AlexWayfer/gorilla_patch)
[![codecov](https://codecov.io/gh/AlexWayfer/gorilla_patch/branch/master/graph/badge.svg)](https://codecov.io/gh/AlexWayfer/gorilla_patch)
[![Code Climate](https://codeclimate.com/github/AlexWayfer/gorilla_patch/badges/gpa.svg)](https://codeclimate.com/github/AlexWayfer/gorilla_patch)

# Installing

```bash
$ gem install gorilla_patch
```

or with `bundler`:

```ruby
# Gemfile
gem 'gorilla_patch'
```

# Using

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

## Using using?!

Yep. It's standart feature. [Read more](http://ruby-doc.org/core/doc/syntax/refinements_rdoc.html)


# Testing

```
$ rake spec
```
