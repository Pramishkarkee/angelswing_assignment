require 'rails_helper'

RSpec.describe "Api::V1::Contents", type: :request do

  describe "GET #index" do
    it "returns a list of contents with token" do
      
      FactoryBot.create_list(:content, 3)
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      get "/api/v1/content",headers: { "Authorization" => "Bearer #{token}" }

      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:success)

      # Parse JSON response
      json_response = JSON.parse(response.body)

      # Expect the response to contain the correct number of contents
      expect(json_response.size).to eq(3) 
    end
    it "unauthorized without token" do 
      get "/api/v1/content"
      # Expect the response to be unauthorized (HTTP status 404)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
