# frozen_string_literal: true

if ENV["RAILS_ENV"] != "production"
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
  RSpec::Core::RakeTask.module_eval do
    def pattern
      extras = []

      extras << api_dir
      extras << authentication_dir
      extras << chat_dir

      [@pattern] | extras
    end

    def api_dir
      File.join(Api::Engine.root, "spec", "**", "*_spec.rb").to_s
    end

    def authentication_dir
      File.join(Authentication::Engine.root, "spec", "**", "*_spec.rb").to_s
    end

    def chat_dir
      File.join(Chat::Engine.root, "spec", "**", "*_spec.rb").to_s
    end
  end
end
