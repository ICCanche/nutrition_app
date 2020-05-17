module API
    module V1
        class PaymentsController < APIController
            include CurrencyHelper
            def stripe_key
                publishableKey = Rails.application.credentials.stripe[:stripe_publishable_key]
                render json: { publishableKey: publishableKey }
            end

            def pay_diet
                diet = Diet.find(payment_params[:dietId])
                puts "PTM #{payment_params}"
                puts "INTENT #{ payment_params[:paymentIntentId] }"
                if diet.approved?
                    payment = StripeService.payDiet(convertMXNPesosToCents(diet.price), payment_params[:paymentMethodId], payment_params[:paymentIntentId], payment_params[:useStripeSdk])
                    render json: payment
                else
                    raise Error::InvalidDietStatus
                end
            end

            private 

            def payment_params
                params.require([:dietId, :useStripeSdk])
                params.permit([:dietId, :paymentMethodId, :paymentIntentId, :useStripeSdk])
            end
        end
    end
end