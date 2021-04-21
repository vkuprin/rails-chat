# frozen_string_literal: true

#
# API Interface is built with Rails Engine.
#
# Responsibilities:
# - Receives all the HTTP calls and interacts with the other components
# - Parses all the responses and send as serializers
#
# USAGE
#
# KNOWN ISSUES

require "api/engine" if defined?(Rails)

require "active_model_serializers"

module Api; end
