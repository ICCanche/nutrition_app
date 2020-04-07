class NewMealViewObject
    attr_reader :meal

    delegate :errors, :model_name, :to_key, :to_model, :name, :content, :diet_id, :meal_type, to: :meal

    def initialize(meal)
        @meal = meal
    end

    def set_diet(id)
        @meal.diet_id = id
    end
end