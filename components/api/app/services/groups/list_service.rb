# frozen_string_literal: true

# Public: Creates a group.
#
# Returns Chat::Group instances.
module Groups
  class ListService
    def call
      ::Chat.groups
    end
  end
end
