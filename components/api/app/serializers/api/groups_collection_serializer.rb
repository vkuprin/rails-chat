# frozen_string_literal: true

module Api
  class GroupsCollectionSerializer < ActiveModel::Serializer
    attributes :groups

    def groups
      object.map do |group|
        Api::GroupSerializer.new(group).as_json
      end
    end
  end
end
