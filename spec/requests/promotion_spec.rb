require 'rails_helper'

RSpec.describe "Promotions", type: :request do  
  describe "GET /promotions to: promotions#index" do
    before do
      #create associated promotions
      @promotion1 = Promotion.create(
        promotion_description: "Half Off",
        discount_percent: 50.0,
      )

      @promotion2 = Promotion.create(
        promotion_description: "Free as can be!",
        discount_percent: 100.0,
      )
    end

    it 'returns a page containing the information of every promotion' do
      get '/promotions'
      expect(response.body).to include(@promotion1.promotion_description)
      expect(response.body).to include(@promotion2.promotion_description)
    end
  end

  #test the show route
  describe "GET /promotions/1 to: promotions#show" do
    before do
      #create our products
      @product1 = Product.create(
          title: "Fancy Art",
      )
      @product2 = Product.create(
          title: "Bad Writing",
      )

      #create associated promotions
      @promotion1 = Promotion.create(
        promotion_description: "Half Off",
        discount_percent: 50.0,
      )

      @promotion2 = Promotion.create(
        promotion_description: "Free as can be!",
        discount_percent: 100.0,
      )      
    end
    
    let!(:admin_user) {
      User.create(
        username: "Admin_User",
        password: "password",
        cart_id: 1,
        email: "testemail@com",
        first_name: "Stephanie",
        last_name: "Whitworth",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990",
        role: 'admin'
      )
    }

    it 'returns a page containing the information of a promotion' do
      get "/promotions/#{@promotion1.id}"
      expect(response.body).to include(@promotion1.promotion_description)
      expect(response.body).to include(@promotion1.discount_percent.to_s)
    end


    it 'updates the promotion information' do  
      post '/login', params: { 
        username: "Admin_User", 
        password: 'password' 
      }

      put "/promotions/#{@promotion1.id}", params: {
        promotion: {
          promotion_description: "Almost Muri", discount_percent:90.0
        }
      }

      follow_redirect!
      @promotion1.reload

      expect(response.body).to include("Almost Muri")
      expect(response.body).to include("90.0")
    end
  end
end
