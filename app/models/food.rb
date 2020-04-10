class Food < ApplicationRecord
  belongs_to :food_category
  has_and_belongs_to_many :customers
  
  validates :name, presence: { :message => :inclusion }
end
