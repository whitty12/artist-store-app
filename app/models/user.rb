class User < ApplicationRecord
    #one user has one set of cart items
    has_one :cart

    def full_name
        "#{first_name} #{last_name}"
    end
end
