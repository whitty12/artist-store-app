require 'rails_helper'

RSpec.describe "Creators", type: :request do
  describe "GET /creators to creators#index" do
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

    #write a test showing the index page is loading correctly
    it 'returns a page containing names of all creators' do
      get '/creators'
      expect(response.body).to include('Skylar Loving')
      expect(response.body).to include('AJ Suning')
    end
  end
  
  describe "GET /creators/:id creators#show" do
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

    @update_creator_params = {first_name: "Stephanie", last_name: "Whitworth"}

    #write a test showing the show page is loading correctly
    it 'returns a page containing the information of a creator' do
      get '/creators/1'
      expect(response.body).to include('Skylar')
      expect(response.body).to include('Alfredo')
    end

    it 'returns a page containing the information of a creator' do
      put '/creators/1', params: @update_creator_params
      expect(response.body).to include('Stephanie')
      expect(response.body).to include('Whitworth')
    end
  end
  
end
