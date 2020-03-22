class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :food_category
end
