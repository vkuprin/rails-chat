# frozen_string_literal: true

require "rails_helper"

RSpec.describe Authentication::User, type: :model do
  context "Validation tests" do
    it { should validate_presence_of(:email) }
  end

  context "Associations tests" do
    it { should have_many(:user_resources) }
  end
end
