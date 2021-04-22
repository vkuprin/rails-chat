# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "api"
  spec.version     = Api::VERSION
  spec.authors     = ["Developers"]
  spec.email       = ["developers@stonks.com"]
  spec.summary     = "Api plugin for Stonks app"
  spec.description = "Api plugin for Stonks app"

  spec.files = Dir["{app,config,db,spec}/**/*"]

  spec.add_dependency "active_model_serializers", "~> 0.10.9"
end
