# frozen_string_literal: true

FactoryBot.define do
  factory :user_resource, class: "Authentication::UserResource" do
    resource_id { Faker::Number.number(2) }
    resource_type { Authentication::RESOURCE_TYPES[:group_message] }
    user_id { create(:user) }
  end
end
