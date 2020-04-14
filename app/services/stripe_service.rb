class StripeService
    def self.createCustomer(localUser)
        stripeCustomer = Stripe::Customer.create({
            email: localUser.email,
            name: "#{localUser.first_name} #{localUser.last_name}"
        })
        return stripeCustomer
    end
end