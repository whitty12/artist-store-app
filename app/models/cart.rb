class Cart < ApplicationRecord
    has_many :product
    belongs_to :user
end
