class DietViewObject
    attr_reader :diet

    delegate :id, :status, :customer, :created_at, :recommendations, :expiration_date, :meals, to: :diet

    def initialize(diet)
        @diet = diet
    end

    def mealsPerType
        meals = diet.meals.order("meal_type")
        results = meals.order("created_at").group_by(&:meal_type).map do |meal_type, meals|
            [meal_type , meals]
        end
        return results
    end

    def to_model
        return @diet
    end

    def canAddMeals
        if @diet.expired? || @diet.paid?
            return false
        else
            return true
        end
    end

    def canEdit
        return  diet.meals.group_by(&:meal_type).count >= 3
    end
end