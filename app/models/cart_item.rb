class CartItem < ApplicationRecord
    has_many :product
    #cart has many items but should belong to one user
    belongs_to :user
end
