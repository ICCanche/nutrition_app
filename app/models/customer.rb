class Customer < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :foods
    has_and_belongs_to_many :goals
    has_and_belongs_to_many :physical_activities
end
