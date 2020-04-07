class Meal < ApplicationRecord
    enum meal_type: [:breakfast, :morning_snack, :lunch, :evening_snack, :dinner]

    belongs_to :diet

    validates :content, presence: { :message => :inclusion }
end
