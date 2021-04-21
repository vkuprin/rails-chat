# frozen_string_literal: true

require "rake"

module Authentication
  class Engine < ::Rails::Engine
    isolate_namespace Authentication

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: "spec/factories"
    end

    initializer "authentication.factories", after: "factory_bot.set_factory_paths" do
      FactoryBot.definition_file_paths << File.expand_path("../../spec/factories", __dir__) if defined?(FactoryBot)
    end

    initializer "authentication.migrations" do |app|
      config.paths["db/migrate"].expanded.each do |expanded_path|
        app.config.paths["db/migrate"] << expanded_path
        ActiveRecord::Migrator.migrations_paths << expanded_path

        next unless Rake.application.top_level_tasks.empty?
        next unless ActiveRecord::Base.connection.migration_context.needs_migration?

        ActiveRecord::Migration.check_pending!
      end
    end
  end
end
