class Meal < ApplicationRecord
    enum weekday: [ :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]
    belongs_to :diet

    validates :name, presence: { :message => :inclusion }, length: { minimum: 4, :message => :minimumMessage  }
    validates :content, presence: { :message => :inclusion }
end
