# frozen_string_literal: true

RSpec.shared_context "with authenticated user" do
  let(:sign_in_url) { "/api/users/sign_in" }
  let(:user) { create(:user) }

  let(:sign_in_params) do
    {
      user: {
        email:    user.email,
        password: user.password
      }
    }
  end

  before { post sign_in_url, params: sign_in_params }
end
