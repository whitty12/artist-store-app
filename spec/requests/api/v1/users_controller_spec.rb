require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  # Set up the users
  let!(:user1) {
      User.create(
        username: "username",
        password: "password",
        email: "testemail@com",
        first_name: "Stephanie",
        last_name: "Whitworth",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990"
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
        role: "basic user"
      )
    }

  describe "GET /api/v1/users" do
    it "returns a list of users" do
      get '/api/v1/users'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['users']).to be_an(Array)
      expect(JSON.parse(response.body)['users'].size).to eq(1)
      expect(JSON.parse(response.body)['users'].first['id']).to eq(current_user.id)
    end
  end

  describe "GET /api/v1/users/:id" do
    it "returns a user" do
      get '/api/v1/users/:id'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['users']).to be_an(Array)
      expect(JSON.parse(response.body)['users'].size).to eq(1)
      expect(JSON.parse(response.body)['users'].first['id']).to eq(current_user.id)
    end
  end

end
