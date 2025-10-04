class Product < ApplicationRecord
    belongs_to :promotion, optional: true
end
