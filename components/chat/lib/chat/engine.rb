# frozen_string_literal: true

require "rake"

module Chat
  class Engine < ::Rails::Engine
    initializer "chat.migrations" do |app|
      config.paths["db/migrate"].expanded.each do |expanded_path|
        app.config.paths["db/migrate"] << expanded_path
        ActiveRecord::Migrator.migrations_paths << expanded_path

        next unless Rake.application.top_level_tasks.empty?
        next unless ActiveRecord::Base.connection.migration_context.needs_migration?

        ActiveRecord::Migration.check_pending!
      end
    end

    isolate_namespace Chat
  end
end
