# WordSearcher

[![Gem Version](https://badge.fury.io/rb/word_searcher.svg)](https://badge.fury.io/rb/word_searcher)
[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

#### Creates and solves word search game.
WordSearcher generates a new word search puzzle with your input word, then tries to solve the puzzle.  It is not programmed to win every game.  It simply compares each letter of the word with all those available on the board, then randomly selects one.  Then, it looks to see if the next letter of the word is joining the prior, and so forth.  It plays more like a human, rather than a computer, so make the game more fun.  Each time you play, notice that the board changes each time, even for the same input word.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'word_searcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install word_searcher

## Usage

1) Add your word to a hash with `:word` symbol key, then pass the arguments to `WordSearcher.search(args)` like the example below.  If you don't pass any args, and just run `WordSearcher.search` it will return sample data for testing.

```
result = WordSearcher.search(word: 'austin')
```

2) The returned data will be in hash format like below:

```
{
  :word=>"austin",
  :found=>["a", "u", "s", "t", "i", "n"],
  :remaining=>[],
  :win=>true,
  :puzzle=>
    [
      ["l", "a", "w", "r", "h", "z", "b"],
      ["i", "p", "m", "b", "c", "j", "l"],
      ["k", "j", "h", "c", "t", "a", "y"],
      ["a", "u", "s", "t", "i", "n", "t"],
      ["d", "s", "o", "v", "f", "x", "h"],
      ["z", "d", "u", "a", "e", "k", "n"],
      ["q", "y", "l", "c", "s", "d", "u"],
      ["k", "z", "r", "m", "x", "g", "d"]
    ]
 }
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/4rlm/word_searcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordSearcher project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/4rlm/word_searcher/blob/master/CODE_OF_CONDUCT.md).
