class Book < ApplicationRecord
    
    scope :visible, ->(){ where(showing: true) }
end 
