class Customer < ApplicationRecord
    has_and_belongs_to_many :foods
    has_and_belongs_to_many :goals

    before_destroy do
        foods.each { |food| food.destroy }
    end

    before_destroy do
        goals.each { |goal| goal.destroy }
    end
end
