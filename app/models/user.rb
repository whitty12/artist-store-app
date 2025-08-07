class User < ApplicationRecord
    #one user has one set of cart items
    has_one :cart_items
end
