# frozen_string_literal: true

module Chat
  class Group < ApplicationRecord
    self.table_name = "groups"

    has_many :group_messages,
             dependent:  :destroy,
             inverse_of: :group,
             class_name: "GroupMessage"

    validates_presence_of :name
  end
end
