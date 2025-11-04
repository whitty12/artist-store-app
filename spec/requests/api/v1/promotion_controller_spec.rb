require 'rails_helper'

RSpec.describe "Api::V1::Promotions", type: :request do
  before do    

  #Question for reviewer: There seems to be a database cleaner function I can use for tests? 
  #I added these because the numbers kept increasing.
    Product.destroy_all      
    Promotion.destroy_all    
    Creator.destroy_all
    User.destroy_all

  #create associated promotions
    @promotion1 = Promotion.create!(
        promotion_description: "Half Off",
        discount_percent: 50.0,
    )
    @promotion2 = Promotion.create!(
          promotion_description: "Free as can be!",
          discount_percent: 100.0,
    )
  end

  describe "GET /api/v1/promotions" do
    it "returns a list of promotions" do
      get '/api/v1/promotions'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['promotions']).to be_an(Array)
      expect(JSON.parse(response.body)['promotions'].size).to eq(2)
      expect(JSON.parse(response.body)['promotions'].first['id']).to eq(@promotion1.id)
    end
  end

  describe "GET /api/v1/promotions/:id" do
    it "returns a promotion" do
      get "/api/v1/promotions/#{@promotion1.id}"

      expect(response).to have_http_status(:ok)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body['id']).to eq(@promotion1.id)
      expect(parsed_body['promotion_description']).to eq(@promotion1.promotion_description)
    end
  end
end