class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  belongs_to :food_category
end
