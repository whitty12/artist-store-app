class User < ApplicationRecord
    #one user has one set of cart items
    has_one :cart
    
    #authentication
    has_secure_password
    validates :role, presence: true
    validates :role, inclusion: {in: ['admin', 'basic user']}

    def full_name
        "#{first_name} #{last_name}"
    end
end
