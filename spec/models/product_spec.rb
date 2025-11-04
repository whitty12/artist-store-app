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

      #Test normal product has a title
      expect(product.title).not_to be_nil
      expect(product.title).to eq("Test Title")

      #Product without a title should not be valid
      expect(invalid_product).not_to be_valid
      expect(invalid_product.errors[:title]).to include("can't be blank")
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

      #test validity of normal product price
      expect(product.price).not_to be_nil
      expect(product.price).to eq(0.25)

      #test invalidity of invalid product price
      expect(invalid_product).not_to be_valid
      expect(invalid_product.errors[:price]).to include("can't be blank")
      
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

      #test regular product description is fine
      expect(product.description).not_to be_nil
      expect(product.description).to eq("A fancy little story")

      #test invalid product to be invalid for nil description
      expect(invalid_product).not_to be_valid
      expect(invalid_product.errors[:description]).to include("can't be blank")
    end

  end
end
