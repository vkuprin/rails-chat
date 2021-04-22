# Api

Api Engine receives all the HTTP calls and interacts with the other components. Parses all the responses and send as serializers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'components/api'
```

And then execute:
```bash
$ bundle
```

Please mount the routes inside your application:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Api::Engine => '/api'
end
```
