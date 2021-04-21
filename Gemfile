# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "active_model_serializers", "0.10.10"
gem "aws-sdk-s3", require: false
gem "bootsnap", "1.5.1"
gem "faker", "~> 2.14.0"
gem "filterrific", "~> 5.2.0"
gem "kaminari", "~> 1.2.1"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 5.0"
gem "rack-cors", "~> 1.1.1"
gem "rails", "~> 6.0.3"
gem "redis"

Dir.glob("components/**/*.gemspec") do |gemspec|
  path      = File.dirname(gemspec)
  component = File.basename(path)

  gem component, path: path
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.4"
  gem "spring", "~> 2.1.1"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :development, :test do
  gem "byebug", "~> 11.1.3", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails", "~> 2.7.6"
  gem "factory_bot_rails", "~> 6.1.0", require: false
  gem "mock_redis"
  gem "oas_parser", "~> 0.25.1"
  gem "rubocop"
end

group :test do
  gem "database_cleaner"
  gem "json-schema", "~> 2.7"
  gem "rspec-rails", "~> 4.0.1"
  gem "shoulda-matchers", "~> 4.4.1"
end
