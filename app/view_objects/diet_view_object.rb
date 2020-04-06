class DietViewObject
    attr_reader :diet

    delegate :id, :status, :customer, :created_at, :recommendations, :expiration_date, to: :diet

    def initialize(diet)
        @diet = diet
    end

    def to_model
        return @diet
    end

    def mealsPerDay
        meals = diet.meals.order("weekday")
        results = meals.order("created_at").group_by(&:weekday).map do |weekday, meals|
            [weekday , meals]
        end
        return results
    end

    def canAddMeals
        if @diet.expired? || @diet.paid? || @diet.meals.group_by(&:weekday).count >= 7
            return false
        else
            return true
        end
    end
end