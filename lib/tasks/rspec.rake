# frozen_string_literal: true

if ENV["RAILS_ENV"] != "production"
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
  RSpec::Core::RakeTask.module_eval do
    def pattern
      extras = []

      extras << File.join(Api::Engine.root, "spec", "**", "*_spec.rb").to_s
      extras << File.join(Authentication::Engine.root, "spec", "**", "*_spec.rb").to_s
      extras << File.join(Chat::Engine.root, "spec", "**", "*_spec.rb").to_s

      [@pattern] | extras
    end
  end
end
