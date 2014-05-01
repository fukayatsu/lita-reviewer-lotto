# lita-reviewer-lotto

Lita

## Installation

Add this line to your lita's Gemfile:

    gem 'lita-reviewer-lotto'

## Usage

```
# lita_config.rb (example)
Lita.configure do |config|
  config.handlers.reviewer_lotto.gh_token         = ENV["GH_TOKEN"]
  config.handlers.reviewer_lotto.gh_organization  = ENV["GH_ORGANIZATION"]
  config.handlers.reviewer_lotto.gh_reviewer_team = ENV["GH_REVIEWER_TEAM"]
end
```

## Contributing

1. Fork it ( http://github.com/fukayatsu/lita-reviewer-lotto/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
