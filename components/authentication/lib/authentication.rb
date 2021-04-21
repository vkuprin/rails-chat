# frozen_string_literal: true

#
# Responsibilities:
# - Handles the Authentication for the User
#
# USAGE
#
# KNOWN ISSUES

require "authentication/version"

require "devise"
require "devise/jwt"

require "authentication/engine"

module Authentication
  class Error < StandardError; end

  RESOURCE_TYPES = {
    group_message: "group_messages.group_message"
  }.freeze
end
