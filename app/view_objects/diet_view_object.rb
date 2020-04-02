class DietViewObject
    attr_reader :diet

    delegate :status, :customer, :created_at, :expiration_date, to: :diet

    def initialize(diet)
        @diet = diet
    end

    def mealsPerDay
        meals = diet.meals.order("weekday")
        results = meals.group_by(&:weekday).map do |weekday, meals|
            [weekday , meals]
        end
        return results
    end
end