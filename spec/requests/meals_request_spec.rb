require 'rails_helper'

RSpec.describe "Meals", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/meals/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/meals/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/meals/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/meals/new"
      expect(response).to have_http_status(:success)
    end
  end

end
