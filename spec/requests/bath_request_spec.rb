require 'rails_helper'

RSpec.describe "Baths", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/bath/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/bath/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/bath/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/bath/new"
      expect(response).to have_http_status(:success)
    end
  end

end
