# WhatDate
Simple solution to such questions as "What date is next Monday?"
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'what_date'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install what_date

## Usage
You can query the date of any day in the current week, the previous week or the following week. You can supply a date so the query is relative to the week of the given date
```
## initialize client
$client = WhatDate.client

## get dates
$client.friday
$client.tuesday(Date.new(2018,2,3))  ##date of tuesday in the week of the given date
$client.prev_tuesday
$client.next_tuesday

```
You can also ask for the date of a particular day of a given month. Use ordinals such as first, second and up to fifth. But 'last' does not work yet.

```
$client.first_monday_of_june_2018
$##4 June 2018
$client.third_tuesday_of_may_2018
$##19 June 2018

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/what_date.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

