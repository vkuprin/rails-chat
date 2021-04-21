# frozen_string_literal: true

module Authentication
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)
      render_resource(resource)
    end

    private

    def render_resource(resource)
      resource.save!
      sign_in(:user, resource)
      create_user_resource(resource)

      render json: ::Authentication::Serializers.user(resource), status: :created
    rescue ActiveRecord::RecordNotUnique
      respond(42_201, I18n.t("errors.messages.generic.422"), 422)
    rescue StandardError => exception
      respond(42_201, exception.message, 422)
    end

    def create_user_resource(resource)
      resource.user_resources.create!(
        resource_id:   resource.id,
        resource_type: Authentication::RESOURCE_TYPES[:group_message]
      )
    end

    def sign_up_params
      params.permit(:email, :password, :password_confirmation)
    end
  end
end
