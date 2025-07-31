class ShortStory < ApplicationRecord
    belongs_to :creator, :product
    has_one :product_type
end
