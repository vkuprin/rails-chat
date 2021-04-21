# frozen_string_literal: true

FactoryBot.define do
  factory :group, class: "Chat::Group" do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
