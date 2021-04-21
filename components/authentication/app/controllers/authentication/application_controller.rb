# frozen_string_literal: true

module Authentication
  class ApplicationController < ActionController::API
    include Errors::ErrorHandler
  end
end
