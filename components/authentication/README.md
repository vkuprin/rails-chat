# Authentication

Authentication engine uses `devise` and `devise-jwt` to provide an authentication strategy for Stonks API.

- [Authentication](#authentication)
  - [Installation](#installation)
  - [Design and Usage](#design-and-usage)
  - [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'components/authentication', path: 'components/authentication'
```

And then execute:
```bash
$ bundle
```

Please mount the routes inside your application:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Authentication::Engine => '/authentication'
end
```

## Design and Usage

First you need to create a new initializer file for devise:
```ruby
# config/initializers/devise.rb
Devise.setup do |config|
  config.router_name = "authentication"
end
```

Run the migration:
```bash
$ rake db:migrate
```

Please mount the routes inside your application:
```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Authentication::Engine => '/'
end
```

Finally, in order to make devise work, you should define the following environment keys in your env file:

```bash
DEVISE_SECRET_KEY=
DEVISE_JWT_SECRET_KEY=
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
