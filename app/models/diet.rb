class Diet < ApplicationRecord
    enum status: [ :requested, :approved, :paid, :expired ]

    belongs_to :customer
    has_many :meals
end
