require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  before do  
    Creator.destroy_all
  
    #set up the creators
    @creator1 = Creator.create(
        first_name: "Skylar",
        last_name: "Alfredo",
    )
    @creator2 = Creator.create(
        first_name: "AJ",
        last_name: "Suning"
    )
  end

  describe "GET /api/v1/creators" do
    it "returns a list of creators" do
      get '/api/v1/creators'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['creators']).to be_an(Array)
      expect(JSON.parse(response.body)['creators'].size).to eq(2)
      expect(JSON.parse(response.body)['creators'].first['id']).to eq(@creator1.id)
    end
  end

  describe "GET /api/v1/creators/:id" do
    it "returns a creator" do
      get "/api/v1/creators/#{@creator1.id}"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(@creator1.id)
      expect(JSON.parse(response.body)['first_name']).to eq("Skylar")
      expect(JSON.parse(response.body)['last_name']).to eq("Alfredo")

    end
  end
end