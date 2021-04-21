# frozen_string_literal: true

#
# Responsibility: Handles multiple errors. Rescues StandardError acts as a Fallback mechanism to
# handle any exception.
#
# USAGE
#
# KNOWN ISSUES

module Errors
  module ErrorHandler
    def self.included(klass)
      klass.class_eval do
        rescue_from ActiveRecord::RecordNotUnique do |_e|
          respond(40_001, I18n.t("errors.messages.generic.400"), 400)
        end

        rescue_from ActiveRecord::RecordInvalid do |_e|
          respond(42_201, I18n.t("errors.messages.generic.422"), 422)
        end

        rescue_from ActionController::ParameterMissing do |_e|
          respond(42_202, I18n.t("errors.messages.generic.422"), 422)
        end

        rescue_from ActiveRecord::NotNullViolation do |_e|
          respond(42_204, I18n.t("errors.messages.generic.422"), 422)
        end

        rescue_from ArgumentError do |_e|
          respond(42_204, I18n.t("errors.messages.generic.422"), 422)
        end

        rescue_from ActiveRecord::RecordNotFound do |_e|
          respond(40_400, I18n.t("errors.messages.generic.404"), 404)
        end
      end
    end

    private

    def respond(code, title, status)
      hash = {
        code:   code,
        title:  title,
        status: status
      }

      render json: [hash], status: status
    end
  end
end
