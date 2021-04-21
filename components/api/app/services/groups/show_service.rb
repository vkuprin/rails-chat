# frozen_string_literal: true

# Public: Creates a group.
#
# current_user - The current user.
# id - The group id.
#
# Returns an Chat::Group instance.
module Groups
  class ShowService
    def call(id)
      return unless id.present?

      group = ::Chat.find_group(id)

      raise GroupNotFound unless group

      group
    end
  end

  class GroupNotFound < StandardError; end
end
