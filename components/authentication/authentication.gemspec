# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "authentication/version"

Gem::Specification.new do |spec|
  spec.name          = "authentication"
  spec.version       = Authentication::VERSION
  spec.authors       = ["Developers"]
  spec.email         = ["developers@stonks.com"]
  spec.summary       = "Devise plugin"
  spec.description   = "Devise plugin"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.add_dependency "active_model_serializers", "~> 0.10.9"
  spec.add_dependency "devise"
  spec.add_dependency "devise-jwt", "~> 0.5.8"
end
