require 'rails_helper'

RSpec.describe "Users", type: :request do  
  describe "GET /users to users#index" do
    User.destroy_all  
  
    let!(:user1) {
        User.create(
          username: "Admin_User",
          password: "password",
          email: "testemail@com",
          first_name: "Stephanie",
          last_name: "Whitworth",
          address: "test address",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
          role: "admin"
        )
      }
      let!(:user2) {
        User.create(
          username: "username2",
          password: "password2",
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
      post '/login', params: { 
        username: "Admin_User", 
        password: 'password' 
      }
      
      get '/users'
      expect(response.body).to include("#{user1.first_name} #{user1.last_name}")
      expect(response.body).to include("#{user2.first_name} #{user2.last_name}")

    end
  end

  describe "/users/:id users#show" do
    let!(:user1) {
      User.create(
        username: "Admin_User",
        password: "password",
        email: "testemail@com",
        first_name: "Stephanie",
        last_name: "Whitworth",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990",
        role: "admin"
      )
    }

    #write a test showing the show page is loading correctly
    it 'returns a page containing the information of a user' do
      post '/login', params: { 
        username: "Admin_User", 
        password: "password"
      }
      get "/users/#{user1.id}"
      expect(response.body).to include("#{user1.first_name} #{user1.last_name}")
      expect(response.body).to include("Password:")
      expect(response.body).to include("#{user1.address}")
      expect(response.body).to include("#{user1.zipcode}")
      expect(response.body).to include("#{user1.state}")
      expect(response.body).to include("#{user1.sex}")
      expect(response.body).to include("#{user1.birthday}")
      expect(response.body).to include("#{user1.email}")
    end

    it 'updates the user information' do
      put "/users/#{user1.id}", params: {
        user:
        {
          first_name: "Steph",
          last_name: "W",
          zipcode: "111111"
        }
      }

      expect(response.body).to include("Steph")
      expect(response.body).to include("111111")
    end
  end
end
