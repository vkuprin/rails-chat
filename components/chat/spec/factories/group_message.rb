# frozen_string_literal: true

FactoryBot.define do
  factory :group_message, class: "Chat::GroupMessage" do
    group { create(:group) }
    user_id { 1 }
    message { Faker::Lorem.word }
  end
end
