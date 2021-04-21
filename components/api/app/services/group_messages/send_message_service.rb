# frozen_string_literal: true

# Public: Sends a message.
#
# current_user - The current user.
# params - The Hash with the message parameters.
#
# Returns an Chat::Group instance.

module GroupMessages
  class SendMessageService
    def initialize(current_user, params)
      @current_user = current_user
      @params = params
    end

    attr_reader :params, :current_user

    def call
      message = group_message

      create_group_message_resource(message.id)
      broadcast_message(message)

      message
    end

    private

    def broadcast_message(message)
      Redis.publish("messages_group#{group.id}", message[:message].to_json)
    end

    def create_group_message_resource(message_id)
      current_user.user_resources.create!(
        resource_id:   message_id,
        resource_type: Authentication::RESOURCE_TYPES[:group_message]
      )
    end

    def group
      ::Chat.find_group(params[:group_id])
    end

    def group_message
      message = ::Chat.create_message(
        user_id: current_user.id,
        group:   group,
        message: params[:message]
      )

      raise GroupMessageCreationError unless message

      message
    end
  end

  class GroupMessageCreationError < StandardError; end
end
