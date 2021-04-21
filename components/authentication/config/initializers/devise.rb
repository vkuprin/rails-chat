# frozen_string_literal: true

require "devise/orm/active_record"

Devise.setup do |config|
  config.authentication_keys = [:email]
  config.case_insensitive_keys = [:email]
  config.expire_all_remember_me_on_sign_out = true
  config.mailer_sender = "developers@stonks.com"
  config.navigational_formats = []
  config.password_length = 6..128
  config.reconfirmable = true
  config.reset_password_within = 6.hours
  config.router_name = :authentication
  config.secret_key = ENV["DEVISE_SECRET_KEY"]
  config.sign_out_via = :delete
  config.skip_session_storage = %i[http_auth params_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.strip_whitespace_keys = [:email]
  config.unlock_keys = [:email]
  config.warden do |manager|
    manager.failure_app = Errors::FailureApp
  end

  config.parent_controller = "Authentication::ApplicationController"

  config.jwt do |jwt|
    jwt.secret = ENV["DEVISE_JWT_SECRET_KEY"]
    jwt.dispatch_requests = [
      ["POST", %r{^/users/sign_in$}]
    ]
    jwt.revocation_requests = [
      ["DELETE", %r{^/users/sign_out$}]
    ]
    jwt.expiration_time = Rails.env.production? ? 10.minutes.to_i : 60.minutes.to_i
  end
end
