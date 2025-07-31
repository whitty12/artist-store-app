class Product < ApplicationRecord
    has_many :product_types
    has_one :details
end
