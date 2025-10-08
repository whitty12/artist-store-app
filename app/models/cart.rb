class Cart < ApplicationRecord
    has_many :cart_items
    #cart has many items but should belong to one user
    belongs_to :user
end
