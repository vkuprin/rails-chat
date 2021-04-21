# frozen_string_literal: true

module Authentication
  class SessionsController < Devise::SessionsController
    respond_to :json

    skip_before_action :verify_signed_out_user

    def create
      super do
        render(json: current_user)

        return
      end
    end

    def destroy
      if signed_in?(resource)
        sign_out(current_user)
        super
      else
        error_message
      end
    end

    private

    def error_message
      render json: {
        code:   42_202,
        title:  I18n.t("errors.messages.generic.422"),
        status: 422
      }, status: 422
    end

    def respond_to_on_destroy
      head :no_content
    end
  end
end
