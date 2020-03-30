class Meal < ApplicationRecord
    enum weekday: [ :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]
    belongs_to :diet
end
