require 'rails_helper'

RSpec.describe "Execretions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/execretions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/execretions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/execretions/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/execretions/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
