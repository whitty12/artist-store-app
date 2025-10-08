require 'rails_helper'

RSpec.describe Creator, type: :model do
  it 'returns the full name of the creator' do
    creator = Creator.create(first_name: 'Stephen', last_name: 'King')

    expect(creator.full_name).to eq 'Stephen King'
  end
end
