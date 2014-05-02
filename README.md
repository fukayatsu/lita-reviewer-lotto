# lita-reviewer-lotto

A reviewer lottery script for Lita

Inspired by [sakatam/hubot-reviewer-lotto](https://github.com/sakatam/hubot-reviewer-lotto)

## Installation

Add this line to your lita's Gemfile:

    gem 'lita-reviewer-lotto'

## Usage

### generate access token on github

https://github.com/settings/tokens/new

[![](https://cloud.githubusercontent.com/assets/1041857/2859368/41fa4ebc-d1a2-11e3-9faa-22aa2c394011.png)](https://cloud.githubusercontent.com/assets/1041857/2859368/41fa4ebc-d1a2-11e3-9faa-22aa2c394011.png)

> Select scopes

- repo
- public_repo
- read:org

### lita config

```
# lita_config.rb (example)
Lita.configure do |config|
  config.handlers.reviewer_lotto.gh_token         = ENV["GH_TOKEN"]          # String
  config.handlers.reviewer_lotto.gh_organization  = ENV["GH_ORGANIZATION"]   # String
  config.handlers.reviewer_lotto.gh_reviewer_team = ENV["GH_REVIEWER_TEAM"]  # Integer
end
```

```
# on your chat
YOU > @bot reviewer for your_repo 123
BOT > foobar has been assigned for https://github.com/your_org/your_repo/pull/123 as a reviewer
```

## Contributing

1. Fork it ( http://github.com/fukayatsu/lita-reviewer-lotto/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
