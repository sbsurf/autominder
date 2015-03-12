require 'rails_helper'

RSpec.describe YearsController, type: :controller do
  describe 'GET #index' do
    before do
      sign_in
      edmunds = instance_double('Edmunds::ModelYear')
      allow(Edmunds::ModelYear).to receive(:new).and_return(edmunds)
      expect(edmunds).to receive(:find_distinct_year_with_new_or_used).and_return(%w[2016 2015 2014])

      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns an array of years' do
      json = JSON.parse(response.body)
      expect(json['years']).to eq(%w[2016 2015 2014])
    end

    it 'returns total count in meta' do
      meta = JSON.parse(response.body)['meta']
      expect(meta['total_count']).to eq(3)
    end
  end
end
