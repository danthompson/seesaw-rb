# Seesaw

*Note: this is currently unreleased.*

A Ruby gem for working with the Seesaw API.

All networking is done with Net::HTTP so you don't have to worry about version conflicts with whatever library you may be using.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'seesaw', github: 'seesawco/seesaw-rb'
```

And then execute:

    $ bundle

## Usage

A client takes an optional access token when you initialize it. If you don't provide one, you can still use it to make unauthenticated requests. If you do provide one, it will set the authorization header for all requests.

``` ruby
> client = Seesaw::Client.new(access_token: 'your_access_token')
> current_user = client.me
> current_user.username
#=> "soffes"
> decision = client.decision(5, 3276)
#=> "Which lamp for the new apartment?"
> slug = client.slug('d/3I0n0g')
> slug.decision.user.username
#=> "soffes"
```

## Contributing

See the [contributing guide](https://github.com/seesawco/seesaw-rb/blob/master/Contributing.markdown).
