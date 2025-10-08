require 'rails_helper'

RSpec.describe "Users", type: :request do  
  describe "GET /users to users#index" do
    let!(:user1) {
      User.create(
        username: "username",
        password: "password",
        cart_id: 1,
        email: "testemail@com",
        first_name: "Stephanie",
        last_name: "Whitworth",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990"
      )
    }
    let!(:user2) {
      User.create(
        username: "username2",
        password: "password2",
        cart_id: 2,
        email: "testemail@com",
        first_name: "Skylar",
        last_name: "Alfredo",
        address: "test address2",
        zipcode: "11111",
        state: "CO",
        sex: "M",
        birthday: "January 3, 1991"
      )
    }

    it 'returns a page containing names of all users' do
      get '/users'
      expect(response.body).to include("#{user1.first_name} #{user1.last_name}")
      expect(response.body).to include("#{user2.first_name} #{user2.last_name}")

    end
  end

  describe "/users/:id users#show" do
    let!(:user1) {
      User.create(
        username: "username",
        password: "password",
        cart_id: 1,
        email: "testemail@com",
        first_name: "Stephanie",
        last_name: "Whitworth",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990"
      )
    }

    @update_user_params = {
        username: "testuser",
        password: "testpassword",
        cart_id: 1,
        email: "testemail@com",
        first_name: "Steph",
        last_name: "W",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990" }

    #write a test showing the show page is loading correctly
    it 'returns a page containing the information of a user' do
      get '/users/1'
      expect(response.body).to include("#{user1.first_name} #{user1.last_name}")
      expect(response.body).to include("#{user1.password}")
      expect(response.body).to include("#{user1.address}")
      expect(response.body).to include("#{user1.zipcode}")
      expect(response.body).to include("#{user1.state}")
      expect(response.body).to include("#{user1.sex}")
      expect(response.body).to include("#{user1.birthday}")
      expect(response.body).to include("#{user1.email}")
    end

    it 'updates the user information' do
      put '/users/1', params: @update_user_params
      expect(response.body).to include("Steph W")
      expect(response.body).to include("testuser")
      expect(response.body).to include("testpassword")
    end
  end
end
