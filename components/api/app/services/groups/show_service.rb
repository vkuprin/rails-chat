# frozen_string_literal: true

# Public: Shows a group.
#
# id - The group id.
#
# Returns an Chat::Group instance.
module Groups
  class ShowService
    def initialize(id)
      @id = id
    end

    attr_reader :id

    def call
      return unless id.present?

      group = ::Chat.find_group(id)

      raise GroupNotFound unless group

      group
    end
  end

  class GroupNotFound < StandardError; end
end
