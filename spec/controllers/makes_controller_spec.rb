require 'rails_helper'

RSpec.describe MakesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    describe "returns array of makes" do
      it "filters by year" do
        get :index, year: '2015'
        json = JSON.parse(response.body)
        expect(json['makes'].length).to eq(42)
      end

      it "returns all" do
        get :index
        json = JSON.parse(response.body)
        expect(json['makes'].length).to eq(61)
      end
    end
  end
end
