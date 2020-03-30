class DietDetailSerializer < ActiveModel::Serializer
    attributes :id, :name, :status, :recommendations, :created_at, :expiration_date, :meals_per_day
    
    def meals_per_day
        meals = object.meals.order("weekday")
        results = meals.group_by(&:weekday).map do |weekday, meals|
            [weekday , serialized_some_models(meals)]
        end.to_h
        return results
    end

    private

    def serialized_some_models meals
        meals.map{ |meal| MealSerializer.new(meal, root: false) }
    end
end