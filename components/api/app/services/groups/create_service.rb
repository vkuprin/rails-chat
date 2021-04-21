# frozen_string_literal: true

# Public: Creates a group.
#
# group_params - The Hash with the group parameters.
#
# Returns an Chat::Group instance.
module Groups
  class CreateService
    def initialize(group_params)
      @group_params = group_params
    end

    attr_reader :group_params

    def call
      group = ::Chat.create_group(group_params)

      raise GroupCreationError unless group

      group
    end
  end

  class GroupCreationError < StandardError; end
end
