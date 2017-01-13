# Gorilla Patch

Ruby Gem for refine Ruby Core classes (like [Monkey patch](https://en.wikipedia.org/wiki/Monkey_patch))

# Installing

```bash
$ gem install gorilla-patch
```

or with `bundler`:

```ruby
# Gemfile
gem 'gorilla-patch'
```

# Using

```ruby
require 'gorilla-patch' # or 'gorilla-patch/keys' for specific functionallity

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
