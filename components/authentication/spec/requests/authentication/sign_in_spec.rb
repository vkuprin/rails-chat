# frozen_string_literal: true

RSpec.describe "POST /api/users/sign_in", type: :request do
  let(:user) { create(:user) }
  let(:url) { "/api/users/sign_in" }
  let(:params) do
    {
      user: {
        email:    user.email,
        password: user.password
      }
    }
  end

  context "when params are correct" do
    before { post url, params: params }

    it "returns 200", :aggregate_failures do
      expect(response).to have_http_status(200)
      expect(response.headers["Authorization"]).to be_present
    end
  end

  context "when params are incorrect" do
    let(:params) do
      {
        mobile_number: "+12347890",
        password:      "SomePassword"
      }
    end

    before { post url, params: params }

    it "returns unauthorized status" do
      expect(response.status).to eq 401
    end
  end
end
