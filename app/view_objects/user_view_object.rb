class UserViewObject
    attr_reader :customer

    delegate :user, to: :customer
  
    def initialize(customer)
      @customer = customer
    end

    def dietRequestStatus
        dietRequestStatus = customer.diets.order('created_at DESC').first
        unless dietRequestStatus != nil
            return "new"
        end
        return dietRequestStatus
    end
end