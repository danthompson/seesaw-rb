# Seesaw

A Ruby gem for working with the Seesaw API.

All networking is done with Net::HTTP so you don't have to worry about version conflicts with whatever library you may be using.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'seesaw'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seesaw

## Usage

A client takes an optional access token when you initialize it. If you don't provide one, you can still use it to make unauthenticated requests. If you do provide one, it will set the authorization header for all requests.

``` ruby
> client = Seesaw::Client.new(your_access_token)
> current_user = client.me
> me.username
#=> "soffes"
> decision = client.decision(5, 3276)
#=> "Which lamp for the new apartment?"
> slug = client.slug('d/3I0n0g')
> slug.decision.user.username
#=> "soffes"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
