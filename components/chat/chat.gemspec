# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "chat/version"

Gem::Specification.new do |spec|
  spec.name        = "chat"
  spec.version     = Chat::VERSION
  spec.authors     = ["Developers"]
  spec.email       = ["developers@stonks.com"]
  spec.summary     = "Chat plugin for Stonks app"
  spec.description = "Chat plugin for Stonks app"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
end
