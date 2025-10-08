require 'rails_helper'
include ActionView::Helpers

RSpec.describe "Api::V1::Users", type: :request do
  #set up the creators
  let!(:creator1) { 
      Creator.create(
        first_name: "Skylar",
        last_name: "Alfredo",
      )
    }
  let!(:creator2) { 
      Creator.create(
        first_name: "AJ",
        last_name: "Suning"
      )
  }


  describe "GET /api/v1/creators" do
    it "returns a list of creators" do
      get '/api/v1/creators'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['creators']).to be_an(Array)
      expect(JSON.parse(response.body)['creators'].size).to eq(1)
      expect(JSON.parse(response.body)['creators'].first['id']).to eq(current_user.id)
    end
  end

  describe "GET /api/v1/creators/:id" do
    it "returns a creator" do
      get '/api/v1/creators/:id'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['creators']).to be_an(Array)
      expect(JSON.parse(response.body)['creators'].size).to eq(1)
      expect(JSON.parse(response.body)['creators'].first['id']).to eq(current_user.id)
    end
  end
end