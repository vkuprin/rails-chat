# frozen_string_literal: true

module Authentication
  module Serializers
    def self.user(user_record, options={})
      ::Authentication::UserSerializer.new(user_record, options).as_json
    end
  end
end
