class User < ApplicationRecord
    has_one :cart
    belongs_to :store
end
