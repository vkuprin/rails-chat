require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load if ENV['RAILS_ENV'] != 'production'

module ChatApi
  class Application < Rails::Application
    config.load_defaults 5.2

    config.api_only = true

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.eager_load_paths << Rails.root.join('lib')
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
