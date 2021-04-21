# frozen_string_literal: true

module Api
  module Serializers
    def self.user(user_record, options={})
      ::Api::UserSerializer.new(user_record, options).as_json
    end

    def self.group(group_record, options={})
      ::Api::GroupSerializer.new(group_record, options).as_json
    end

    def self.groups(groups_record, options={})
      ::Api::GroupsCollectionSerializer.new(groups_record, options).as_json
    end

    def self.group_message(group_message_record, options={})
      ::Api::GroupMessageSerializer.new(group_message_record, options).as_json
    end
  end
end
