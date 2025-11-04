require 'rails_helper'

RSpec.describe "Creators", type: :request do
  describe "GET /creators to creators#index" do
    User.destroy_all

    let!(:creator1) { 
      Creator.create(
        first_name: "Skylar",
        last_name: "Loving",
      )
    }
    let!(:creator2) { 
      Creator.create(
        first_name: "AJ",
        last_name: "Suning"
      )
    }
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

    #write a test showing the index page is loading correctly
    it 'returns a page containing names of all creators' do
      get '/creators'
      expect(response.body).to include('Skylar Loving')
      expect(response.body).to include('AJ Suning')
    end
  end
  
  describe "GET /creators/:id creators#show" do
    User.destroy_all

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

    #write a test showing the show page is loading correctly
    it 'returns a page containing the information of a creator' do
      get "/creators/#{creator1.id}"
      expect(response.body).to include('Skylar')
      expect(response.body).to include('Alfredo')
    end

    it 'returns a page containing the information of a creator' do
      post '/login', params: { 
        username: "Admin_User", 
        password: 'password' 
      }
      put "/creators/#{creator1.id}", params: { 
        product: { 
          first_name:"Test",
          last_name: "W"
        }
      }

      creator1.reload
      
      expect(response.body).to include('Test')
      expect(response.body).to include('W')
    end
  end
  
end
