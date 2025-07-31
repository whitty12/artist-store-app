class Store < ApplicationRecord
    has_many :cart, through: :user
    has_many :product
end
