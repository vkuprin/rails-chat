# frozen_string_literal: true

module Chat
  class GroupMessage < ApplicationRecord
    self.table_name = "group_messages"

    belongs_to :group, inverse_of: :group_messages

    validates_presence_of :user_id, :message
  end
end
