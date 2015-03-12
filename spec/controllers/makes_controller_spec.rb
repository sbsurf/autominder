require 'rails_helper'

RSpec.describe MakesController, type: :controller do
  describe 'GET #index' do
    let(:edmunds) { instance_double('Edmunds::Make') }
    # let(:makes) { FactoryGirl.create_list(:make, 3) }
    let(:makes) { [{id: 200002038, models: []}, {id: 200464140, models: []}] }
    let(:makes_all) { [{id: 200002038, models: []}, {id: 200464140, models: []}, {id: 200000001, models: []}] }

    before do
      sign_in
      allow(Edmunds::Make).to receive(:new).and_return(edmunds)
    end

    it 'returns http success' do
      allow(edmunds).to receive(:find_all).and_return([])
      get :index
      expect(response).to have_http_status(:success)
    end

    describe 'returns array of makes' do
      it 'filters by year' do
        expect(edmunds).to receive(:find_makes_by_model_year).with('2015').and_return(makes)
        # TODO: replace with factories

        get :index, year: '2015'

        json = JSON.parse(response.body)
        expect(json['makes']).to eq([{"id" => 200002038, "models" => []}, {"id" => 200464140, "models" => []}])
      end

      it 'returns all' do
        # allow(Edmunds::Make).to receive(:new).and_return(edmunds)
        expect(edmunds).to receive(:find_all).and_return(makes_all)
        # TODO: replace with factories

        get :index

        json = JSON.parse(response.body)
        expect(json['makes']).to eq([{"id" => 200002038, "models" => []}, {"id" => 200464140, "models" => []}, {"id" => 200000001, "models" => []}])
      end
    end
  end
end
