# frozen_string_literal: true

module Api
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: "spec/factories"
    end

    initializer "api.factories", after: "factory_bot.set_factory_paths" do
      file_path = File.expand_path("../../spec/factories", __dir__)
      FactoryBot.definition_file_paths << file_path if defined?(FactoryBot)
    end

    isolate_namespace Api
  end
end
