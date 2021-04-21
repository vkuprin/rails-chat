# frozen_string_literal: true

module Authentication
  class JWTBlacklist < ActiveRecord::Base
    self.table_name = "jwt_blacklists"

    include Devise::JWT::RevocationStrategies::Blacklist
  end
end
