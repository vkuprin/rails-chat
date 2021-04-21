# frozen_string_literal: true

# Public: Creates a group.
#
# current_user - The current user.
# group_params - The Hash with the group parameters.
#
# Returns an Chat::Group instance.
module Groups
  class CreateService
    def call(group_params)
      group = ::Chat.create_group(group_params)

      raise GroupCreationError unless group

      group
    end
  end

  class GroupCreationError < StandardError; end
end
