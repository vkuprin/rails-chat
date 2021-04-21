# frozen_string_literal: true

# Public: Lists groups.
#
# Returns Chat::Group instances.
module Groups
  class ListService
    def call
      ::Chat.groups
    end
  end
end
