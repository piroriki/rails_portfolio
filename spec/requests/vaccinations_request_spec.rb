require 'rails_helper'

RSpec.describe "Vaccinations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/vaccinations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/vaccinations/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/vaccinations/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/vaccinations/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
