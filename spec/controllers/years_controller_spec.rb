require 'rails_helper'

RSpec.describe YearsController, type: :controller do
  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns an array of years" do
      json = JSON.parse(response.body)
      expect(json['years'].length).to eq(27)
    end
  end
end
