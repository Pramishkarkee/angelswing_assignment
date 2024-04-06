require 'rails_helper'

RSpec.describe "Contents", type: :request do
  describe "GET #index" do
    it "returns a list of contents" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
