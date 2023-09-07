require 'rails_helper'

RSpec.describe "HeadCircumferences", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/head_circumferences/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/head_circumferences/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/head_circumferences/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/head_circumferences/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
