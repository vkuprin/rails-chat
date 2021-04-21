# frozen_string_literal: true

module Authentication
  class UserResource < ActiveRecord::Base
    self.table_name = "user_resources"

    belongs_to :user, class_name: "Authentication::User"

    validates :user, presence: true
    validates :resource_id, presence: true
    validates :resource_type, presence: true

    scope :type, ->(type) { where(resource_type: type) }
    scope :group_messages, -> { type(Authentication::RESOURCE_TYPES[:group_message]) }
  end
end
