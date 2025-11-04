class Product < ApplicationRecord
    belongs_to :promotion, optional: true
    belongs_to :creator

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }

end
