class Diet < ApplicationRecord
    enum status: [ :requested, :approved, :paid ]
    belongs_to :customer
end
