class CartItem < ApplicationRecord
    belongs_to :product
    #cart has many items but should belong to one user
    belongs_to :cart
end
