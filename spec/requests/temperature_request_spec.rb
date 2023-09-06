require 'rails_helper'

RSpec.describe "BodyTemperatures", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/body_temperature/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/body_temperature/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/body_temperature/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/body_temperature/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
