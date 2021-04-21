# frozen_string_literal: true

module Authentication
  class User < ActiveRecord::Base
    self.table_name = "users"

    has_many :user_resources, class_name: "Authentication::UserResource"

    devise :database_authenticatable,
           :registerable,
           :jwt_authenticatable,
           jwt_revocation_strategy: JWTBlacklist,
           authentication_keys:     [:email]

    validates_presence_of :email
  end
end
