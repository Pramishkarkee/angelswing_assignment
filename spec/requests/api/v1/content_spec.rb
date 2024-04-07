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
  describe "GET #show" do
    it "returns a content with token" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      get "/api/v1/content/1",headers: { "Authorization" => "Bearer #{token}" }

      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:success)
    end
    it "unauthorized without token" do 
      get "/api/v1/content/1"
      # Expect the response to be unauthorized (HTTP status 404)
      expect(response).to have_http_status(:unauthorized)
    end
    it "Not Found a content with token" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      get "/api/v1/content/100",headers: { "Authorization" => "Bearer #{token}" }

      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:not_found)
    end
  end
  describe "POST #create" do
    let(:valid_attributes) {
      { title: 'New Article', body: 'The content of the new article.', slug: 'this-is-title', summary: 'this is summary' }
    }
    let(:invalid_attributes) {
      { title: '', content: '' }
    }
    it "New content create with token" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      post "/api/v1/content" , params: { content: valid_attributes } ,headers: { "Authorization" => "Bearer #{token}" }

      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:success)
    end
    it "New content create with invalid attribute" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      post "/api/v1/content" , params: { content: invalid_attributes } ,headers: { "Authorization" => "Bearer #{token}" }

      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it "New content create without token" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      post "/api/v1/content" , params: { content: invalid_attributes }
      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:unauthorized)
    end
  end
  describe "PUT #update" do
    let(:valid_attributes) {
      { title: 'New Article', body: 'The content of the new article.', slug: 'this-is-title', summary: 'this is summary' }
    }
    let(:invalid_attributes) {
      { title: '', content: '' }
    }
    it "update content  with token" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      put "/api/v1/content/1" , params: { content: valid_attributes } ,headers: { "Authorization" => "Bearer #{token}" }

      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:success)
    end
    it "update content  with invalid attribute" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      put "/api/v1/content/1" , params: { content: invalid_attributes } ,headers: { "Authorization" => "Bearer #{token}" }

      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it "update content  without token" do
      user = FactoryBot.create(:user)
      token = user.generate_jwt
      post "/api/v1/content/1" , params: { content: invalid_attributes }
      # Expect the response to be successful (HTTP status 200)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
