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
    User.destroy_all
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

    it 'does not allow invalid roles' do
      invalid_role =
        User.create(
          username: "basic_user",
          password: "password",
          email: "email@com",
          first_name: "Steph",
          last_name: "W",
          address: "test address",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
          role: 'random'
        )

        expect(invalid_role).not_to be_valid
    end

    it 'has a unique username' do
      repeated_user =
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

      blank_username =
        User.create(
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
      #test valid user is created
      expect(user.username).not_to be_nil
      expect(user.username).to eq("default_user")

      #test for invalid unique name
      expect(repeated_user).not_to be_valid

      #test for invalid blank name
      expect(blank_username).not_to be_valid
      expect(blank_username.errors[:username]).to include("can't be blank")
    end

    it 'has a password' do
      blank_password =
        User.create(
          username: "default_user",
          email: "testemail@com",
          first_name: "Steph",
          last_name: "W",
          address: "test address",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
      )
      #test valid user is created
      expect(user.password_digest).not_to be_nil

      #test for invalid blank name
      expect(blank_password).not_to be_valid
      expect(blank_password.errors[:password]).to include("can't be blank")
    end

    it 'has an address' do
      blank_address =
        User.create(
          username: "default_user",
          password: "password",
          email: "testemail@com",
          first_name: "Steph",
          last_name: "W",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
      )
      #test valid user is created
      expect(user.address).not_to be_nil
      expect(user.address).to eq("test address")

      #test blank address
      expect(blank_address).not_to be_valid
      expect(blank_address.errors[:address]).to include("can't be blank")
    end

    it 'has a unique email' do
      blank_email =
        User.create(
          username: "good_email_user",
          password: "password",
          first_name: "Steph",
          last_name: "W",
          address: "test address",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
      )
      repeated_email =
        User.create(
          username: "bad_email",
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
      #test valid user is created
      expect(user.email).not_to be_nil
      expect(user.email).to eq("testemail@com")

      #test blank email
      expect(blank_email).not_to be_valid
      expect(blank_email.errors[:email]).to include("can't be blank")

      #test for invalid unique email
      expect(repeated_email).not_to be_valid

    end

    it 'has a zip code' do
      blank_zipcode =
        User.create(
          username: "default_user",
          password: "password",
          email: "testemail@com",
          first_name: "Steph",
          last_name: "W",
          address: "test address",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
      )
      #test valid user is created
      expect(user.zipcode).not_to be_nil
      expect(user.zipcode).to eq("00000")

      #test blank zipcode
      expect(blank_zipcode).not_to be_valid
      expect(blank_zipcode.errors[:zipcode]).to include("can't be blank")
    end

    it 'has a first name' do
      blank_firstname =
        User.create(
          username: "default_user",
          password: "password",
          email: "testemail@com",
          last_name: "W",
          address: "test address",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
      )
      #test valid user is created
      expect(user.first_name).not_to be_nil
      expect(user.first_name).to eq("Steph")

      #test blank first name
      expect(blank_firstname).not_to be_valid
      expect(blank_firstname.errors[:first_name]).to include("can't be blank")
    end

    it 'has a last name' do
      blank_lastname =
        User.create(
          username: "default_user",
          password: "password",
          email: "testemail@com",
          first_name: "Steph",
          address: "test address",
          zipcode: "00000",
          state: "CO",
          sex: "F",
          birthday: "January 1, 1990",
      )
      #test valid user is created
      expect(user.last_name).not_to be_nil
      expect(user.last_name).to eq ("W")

      #test blank last name
      expect(blank_lastname).not_to be_valid
      expect(blank_lastname.errors[:last_name]).to include("can't be blank")
    end

    it 'has a state' do
      blank_state =
        User.create(
          username: "default_user",
          password: "password",
          email: "testemail@com",
          first_name: "Steph",
          last_name: "W",
          address: "test address",
          zipcode: "00000",
          sex: "F",
          birthday: "January 1, 1990",
      )
      #test valid user is created
      expect(user.state).not_to be_nil
      expect(user.state).to eq ("CO")

      #test blank state
      expect(blank_state).not_to be_valid
      expect(blank_state.errors[:state]).to include("can't be blank")
    end
  end

end
