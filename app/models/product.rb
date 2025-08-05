class Product < ApplicationRecord
    has_one :product_type
    has_one :detail
    has_one :artwork
    has_many :creator
end
