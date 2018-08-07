# DailyRecipe

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/daily_recipe`. To experiment with that code, run `bin/console` for an interactive prompt.

 This gem is designed to encourage the user to try eating vegan for 30 days.  It provides the user with two recipe choices each day.  The user is given more information when they choose one of the recipes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daily_recipe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daily_recipe

## Usage

Follow the directions above to install this gem.  Begin the CLI by typing ./bin/daily-recipe.  The user provides input about the number of days they've been eating the vegan recipes and two new recipes are provided each day.  The user can then type in the number corresponding with their favorite recipe and they are given a description of the recipe along with a url that leads to the recipe's web page.  When the user has reached 30 days of recipes, they are told, "Congratulations, you are now a vegan!"  Type "exit" to exit the CLI.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to rubygems.org.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'DeedaG'/daily_recipe. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DailyRecipe project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'DeedaG'/daily_recipe/blob/master/CODE_OF_CONDUCT.md).
