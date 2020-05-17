class StripeService
    def self.createCustomer(localUser)
        stripeCustomer = Stripe::Customer.create({
            email: localUser.email,
            name: "#{localUser.first_name} #{localUser.last_name}"
        })
        return stripeCustomer
    end

    def self.payDiet(price, paymentMethodId = nil, paymentIntentId = nil, useStripeSdk)
        if paymentMethodId
            intent = Stripe::PaymentIntent.create({
                amount: price,
                currency: 'mxn',
                payment_method: paymentMethodId,
                confirmation_method: 'manual',
                confirm: true,
                use_stripe_sdk: useStripeSdk,
            })
        elsif paymentIntentId
            intent = Stripe::PaymentIntent.confirm(paymentIntentId)
        end
        generate_response(intent)
    end
    
    def self.generate_response(intent)
        case intent['status']
        when 'requires_action', 'requires_source_action'
          # Card requires authentication
          return {
            requiresAction: true,
            paymentIntentId: intent['id'],
            clientSecret: intent['client_secret']
          }
        when 'requires_payment_method', 'requires_source'
          # Card was not properly authenticated, new payment method required
          return {
            error: 'Your card was denied, please provide a new payment method'
          }
        when 'succeeded'
          # Payment is complete, authentication not required
          # To cancel the payment you will need to issue a Refund (https://stripe.com/docs/api/refunds)
         
          return {
            clientSecret: intent['client_secret']
          }
        end
    end
end