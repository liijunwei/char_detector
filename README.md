# CharDetector

## What

This tool helps find whether a file contains [ASCII control characters](https://theasciicode.com.ar/), print location info if true.

## Why

It's annoying while working with sublime search. If a file somehow contains a ASCII control characters, it'll be treated as "binary" and won't show the result preview. And this kind of "binary" files tweaks the behavior of text editor.

So I'd like to find these files and get rid of these control characters very much.

Ref: [ASCII table , ascii codes](https://theasciicode.com.ar/)

## Installation(WIP)

Add this line to your application's Gemfile:

+ TODO publish this gem to https://rubygems.org/

```ruby
gem 'char_detector'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install char_detector
```

## Usage

### demo on detecting in single file

```bash
bin/char_detector -f spec/samples/sample0.txt
bin/char_detector -f spec/samples/sample1-newline.txt
bin/char_detector -f spec/samples/sample2.txt
bin/char_detector -f spec/samples/sample3.txt
bin/char_detector -f spec/samples/sample4.txt
bin/char_detector -f spec/samples/sample5.txt
```

### demo on detecting in file directory and file pattern

```bash
# parallel is GNU parallel to speed up the scanning process
# macos: https://formulae.brew.sh/formula/parallel

parallel --progress --timeout 50 --retries 3 "bin/char_detector -f {}" ::: $(find spec/samples -type f)
# same as
find spec/samples -type f | parallel --progress --timeout 50 --retries 3 "bin/char_detector -f {}"
# same as
find spec/samples -type f | xargs -I {} bin/char_detector -f {} # this one is slow, so GNU parallel is recommended :D
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/char_detector. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/char_detector/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CharDetector project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/char_detector/blob/master/CODE_OF_CONDUCT.md).
