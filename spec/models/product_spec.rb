require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'validations' do
    it 'requires a product title' do
      creator = Creator.create(
        first_name: 'Stephen', 
        last_name: 'King'
      )
      product = Product.create(
        title: 'Test Title',
        medium:"Writing",
        creator_id: creator.id,
        description: "A fancy little story",
        price: 0.25,
        available: true
      )
      invalid_product = Product.create(
        title: nil,
        medium:"Writing",
        creator_id: creator.id,
        description: nil,
        price: 0.25,
        available: true
      )

      expect(product.title).not_to be_nil
      expect(product.title).to eq("Test Title")

      expect(invalid_product).not_to be_valid
    end

    it 'requires a product price' do
      creator = Creator.create(
        first_name: 'Stephen', 
        last_name: 'King'
      )
      product = Product.create(
        title: 'Test Title',
        medium:"Writing",
        creator_id: creator.id,
        description: "A fancy little story",
        price: 0.25,
        available: true
      )
      invalid_product = Product.create(
        title: 'Test Title',
        medium:"Writing",
        creator_id: creator.id,
        description: "A fancy little story",
        price: nil,
        available: true
      )

      expect(product.price).not_to be_nil
      expect(product.price).to eq(0.25)

      expect(invalid_product).not_to be_valid
    end

    it 'requires a product description' do
      creator = Creator.create(
        first_name: 'Stephen', 
        last_name: 'King'
      )
      product = Product.create(
        title: 'Test Title',
        medium:"Writing",
        creator_id: creator.id,
        description: "A fancy little story",
        price: 0.25,
        available: true
      )

      invalid_product = Product.create(
        title: 'Test Title',
        medium:"Writing",
        creator_id: creator.id,
        description: nil,
        price: 0.25,
        available: true
      )

      expect(product.description).not_to be_nil
      expect(product.description).to eq("A fancy little story")

      expect(invalid_product).not_to be_valid
    end

  end
end
