require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  
  before do
    User.destroy_all
    
        # Create user
      @user = User.create!(
        username: "username2",
        password: "password2",
        email: "test@email.com",
        first_name: "Skylar",
        last_name: "Alfredo",
        address: "test address2",
        zipcode: "11111",
        state: "CO",
        sex: "M",
        birthday: "January 3, 1991",
        role: "basic user"
      )

      # Set up the users
      @admin = User.create!(
            username: "username",
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
  end  

  describe "GET /api/v1/users" do
    it "returns a list of users" do
      #log in as admin
      post '/api/v1/login', params: { 
        username: "Admin_User", 
        password: 'password' 
      }
      
      get '/api/v1/users'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['users']).to be_an(Array)
      expect(JSON.parse(response.body)['users'].size).to eq(2)
      expect(JSON.parse(response.body)['users'].first['id']).to eq(@user.id)
    end
  end

  describe "GET /api/v1/users/:id" do
    it "returns a user" do
      
      #log in as user
      post '/api/v1/login', params: { 
        username: "username2", 
        password: 'password2' 
      }
      get "/api/v1/users/#{@user.id}"

      expect(response).to have_http_status(:ok)

      parsed_body = JSON.parse(response.body)

      expect(parsed_body['id']).to eq(@user.id)
      expect(parsed_body['username']).to eq('username2')
    end
  end

end
