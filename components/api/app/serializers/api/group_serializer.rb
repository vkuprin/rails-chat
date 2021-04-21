# frozen_string_literal: true

module Api
  class GroupSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :messages,
               :created_at,
               :updated_at

    def messages
      object.group_messages.map do |group_message|
        Api::GroupMessageSerializer.new(group_message).as_json
      end
    end
  end
end
