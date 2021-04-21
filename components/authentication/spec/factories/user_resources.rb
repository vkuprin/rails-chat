# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: "Authentication::User" do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end
