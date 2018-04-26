# RailsbpInBrowser

This gem based on 'rails_best_practices' which is used to analyze the code of Rails project. The output of 'rails_best_practices' is not very readable, which didn't
supply more details on which code has problem. In order to get the specific code detail and it's problems, I created this gem.

It will generate a more specific output in html format and open it in your default browser for you.

![Example]('./images/railsbp_in_browser_examp.jpg')

## Installation

You could add it to you Gemfile(development group)

```ruby
gem 'railsbp_in_browser'
```

And then execute:

    $ bundle

Or install it yourself as(in the root directory of your Rails app):

    $ gem install railsbp_in_browser

## Usage

run `$ railsbp_in_browser`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/railsbp_in_browser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsbpInBrowser project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/railsbp_in_browser/blob/master/CODE_OF_CONDUCT.md).
