class PhysicalActivity < ApplicationRecord
    has_and_belongs_to_many :customer
end
