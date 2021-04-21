# frozen_string_literal: true

module Api
  class GroupMessageSerializer < ActiveModel::Serializer
    attributes :id,
               :user_id,
               :group_id,
               :message,
               :created_at,
               :updated_at
  end
end
