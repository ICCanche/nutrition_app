class Food < ApplicationRecord
  belongs_to :food_category
  has_and_belongs_to_many :customers
end
