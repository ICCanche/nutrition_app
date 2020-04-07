class DietDetailSerializer < ActiveModel::Serializer
    attributes :id, :name, :status, :recommendations, :created_at, :expiration_date, :meals_per_type

    def meals_per_type
        meals = object.meals.order("meal_type")
        results = meals.order("created_at").group_by(&:meal_type).map do |meal_type, meals|
            [meal_type , serialized_meals(meals)]
        end
        return results
    end

    private

    def serialized_meals meals
        meals.map{ |meal| MealSerializer.new(meal, root: false) }
    end
end