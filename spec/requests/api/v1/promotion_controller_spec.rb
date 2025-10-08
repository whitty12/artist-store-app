require 'rails_helper'

RSpec.describe "Api::V1::Promotions", type: :request do
  # Set up the promotions
 #create associated promotions
  @promotion1 = Promotion.create(
      promotion_description: "Half Off",
      discount_percent: 50.0,
   )
   @promotion2 = Promotion.create(
        promotion_description: "Free as can be!",
        discount_percent: 100.0,
   )

  describe "GET /api/v1/promotions" do
    it "returns a list of promotions" do
      get '/api/v1/promotions'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['promotions']).to be_an(Array)
      expect(JSON.parse(response.body)['promotions'].size).to eq(1)
      expect(JSON.parse(response.body)['promotions'].first['id']).to eq(current_user.id)
    end
  end

  describe "GET /api/v1/promotions/:id" do
    it "returns a promotion" do
      get '/api/v1/promotions/:id'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['promotions']).to be_an(Array)
      expect(JSON.parse(response.body)['promotions'].size).to eq(1)
      expect(JSON.parse(response.body)['promotions'].first['id']).to eq(current_user.id)
    end
  end
end