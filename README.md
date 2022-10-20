# ruby_app

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

This is the solution of tech task.

### Tech

Dillinger uses a number of open source projects to work properly:

* [Ruby 3.1.2]
* [RSpec] - Rspec tests
* [Guard && Guard-RSpec] - autotest for rspec
* [Rubocop] - Ruby static code analyzer
* [Simplecov] - Code coverage analysis tool for Ruby
* [Dry-monads] - Common monads in idiomatic Ruby

### Installation

```sh
$ cd ruby_app
$ bundle install
```

### Running Script

```sh
$ cd ruby_app
$ ruby parser.rb webserver.log
```

### Tests && code coverage

```sh
$ cd ruby_app
$ rspec spec
$ open coverage/index.html
```

### Guard

```sh
$ cd ruby_app
$ guard --clear
```
