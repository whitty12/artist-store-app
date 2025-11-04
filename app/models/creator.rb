#This refers to the Artist/Creator that pertains to a work, but might not be a user
class Creator < ApplicationRecord
    has_many :products

    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
        "#{first_name} #{last_name}"    
    end
end
