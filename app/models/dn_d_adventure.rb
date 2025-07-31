class DnDAdventure < ApplicationRecord
    belong_to :creator, :product
    has_one :product_type
end
