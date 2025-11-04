class User < ApplicationRecord
    #one user has one cart
    has_one :cart
    
    #authentication
    #Future goal: Use gems that independently checks for a real address, zip, state, ect.
    has_secure_password
    validates :role, presence: true
    validates :role, inclusion: {in: ['admin', 'basic user']}
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true 
    validates :last_name, presence: true
    validates :address, presence: true
    validates :zipcode, presence: true
    validates :email, presence: true, uniqueness: true
    validates :state, presence: true

    def full_name
        "#{first_name} #{last_name}"
    end
end
