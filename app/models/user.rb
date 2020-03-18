class User < ApplicationRecord
    enum role: [ :customer, :admin ]
end
