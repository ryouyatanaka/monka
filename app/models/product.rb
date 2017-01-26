class Product < ApplicationRecord
  scope :visible, ->(){ where(showing: true) }
  has_many :order_details
  has_many :line_items
end
