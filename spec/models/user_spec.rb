require 'rails_helper'

RSpec.describe User, type: :model do
  describe "full_name" do
    let!(:user) {
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
    
    it 'combines first and last name' do
      expect(user.full_name).to eq('Stephanie Whitworth')
    end
  end

  describe "validations" do
    let!(:admin_user) {
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
    let!(:user) {
      User.create(
        username: "default_user",
        password: "password",
        email: "testemail@com",
        first_name: "Steph",
        last_name: "W",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990",
      )
    }
    
    it 'has a default basic user role unless specified' do
      expect(user.role).to eq('basic user')
      expect(admin_user.role).to eq('admin')
    end

    it 'has a unique username' do
      invalid_username_user =
        User.create(
          username: "default_user",
          password: "password",
          email: "testemail@com",
          first_name: "Steph",
          last_name: "W",
          address: "test address",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
        )

      expect(user.username).not_to be_nil
      expect(invalid_username_user).not_to be_valid
    end

    it 'has a password' do
      expect(user.password_digest).not_to be_nil
    end

    it 'has an address' do
      expect(user.address).not_to be_nil
      expect(user.address).to eq("test address")
    end

    it 'has an email' do
      expect(user.email).not_to be_nil
      expect(user.email).to eq("testemail@com")
    end

    it 'has a zip code' do
      expect(user.zipcode).not_to be_nil
      expect(user.zipcode).to eq("00000")
    end

    it 'has a first name' do
      expect(user.first_name).not_to be_nil
      expect(user.first_name).to eq("Steph")
    end

    it 'has a last name' do
      expect(user.last_name).not_to be_nil
      expect(user.last_name).to eq ("W")
    end

    it 'has a state' do
      expect(user.state).not_to be_nil
      expect(user.state).to eq ("CO")
    end
  end

end
