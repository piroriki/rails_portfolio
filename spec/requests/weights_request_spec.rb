require 'rails_helper'

RSpec.describe "Weights", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/weights/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/weights/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/weights/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/weights/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
