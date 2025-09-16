class Product < ApplicationRecord
    belongs_to :product_type
    has_one :product_detail
    has_one :artwork
    has_many :creator
    has_many :promotions

    accepts_nested_attributes_for :product_detail, allow_destroy: true
end
