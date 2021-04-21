# frozen_string_literal: true

module Api
  class GroupMessagesController < BaseController
    def create
      message = ::GroupMessages::SendMessageService.new(current_user, group_messages_params).call

      render json: Api::Serializers.group_message(message), status: :created
    rescue GroupMessages::GroupNotFound
      respond(40_401, exception.message, 404)
    rescue GroupMessages::GroupMessageCreationError, StandardError => exception
      respond(42_201, exception.message, 422)
    end

    def group_messages_params
      params.require(:group_message).permit(:message, :group_id)
    end
  end
end
