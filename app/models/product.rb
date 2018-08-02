class Product < ApplicationRecord
    has_many :inventories

    validates_numericality_of :price, :message=>"Error Message"
end

