#This refers to the Artist/Creator that pertains to a work, but might not be a user
class Creator < ApplicationRecord
    has_many :product


    def full_name
        "#{first_name} #{last_name}"    
    end

end
