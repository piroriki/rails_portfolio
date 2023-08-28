require 'rails_helper'

RSpec.describe "Symptoms", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/symptoms/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/symptoms/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/symptoms/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/symptoms/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
