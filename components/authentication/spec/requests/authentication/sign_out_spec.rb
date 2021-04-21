# frozen_string_literal: true

RSpec.describe "DELETE /api/users/sign_out", type: :request do
  let(:sign_in_url) { "/api/users/sign_in" }
  let(:sign_out_url) { "/api/users/sign_out" }
  let(:user) { create(:user) }
  let(:params) do
    {
      user: {
        email:    user.email,
        password: user.password
      }
    }
  end

  context "when params are correct" do
    before { post sign_in_url, params: params }

    it "returns 200" do
      delete sign_out_url, headers: headers(response)

      expect(response).to have_http_status(:no_content)
    end
  end

  context "when user is not authenticated" do
    before { post sign_in_url, params: params }

    it "returns 422" do
      delete sign_out_url
      expect(response.status).to eq(422)
      expect(json_response["status"]).to eq(422)
      expect(json_response["code"]).to eq(42_202)
      expect(json_response["title"]).to eq("Invalid parameters")
    end
  end
end
