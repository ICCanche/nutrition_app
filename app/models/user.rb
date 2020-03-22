class User < ApplicationRecord
    enum role: [ :customer, :admin ]
    has_one :customer
end
