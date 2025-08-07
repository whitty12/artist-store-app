class Product < ApplicationRecord
    has_one :product_type
    has_one :product_detail
    has_one :artwork
    has_many :creator
end
