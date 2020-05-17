module API
    module V1
        class PaymentsController < APIController
            include CurrencyHelper
            before_action :authenticate_user, :check_permissions
            
            def stripe_key
                publishableKey = Rails.application.credentials.stripe[:stripe_publishable_key]
                render json: { publishableKey: publishableKey }
            end

            def pay_diet
                diet = Diet.find(payment_params[:dietId])
                if diet.approved?
                    response = StripeService.payDiet(convertMXNPesosToCents(diet.price), payment_params[:paymentMethodId], payment_params[:paymentIntentId], payment_params[:useStripeSdk])
                    change_diet_status(response, diet)
                    render json: response
                else
                    raise Error::InvalidDietStatus
                end
            end

            private 

            def payment_params
                params.require([:dietId, :useStripeSdk])
                params.permit([:dietId, :paymentMethodId, :paymentIntentId, :useStripeSdk])
            end

            def change_diet_status(response, diet)
                if response.has_key? :clientSecret
                    diet.status = :paid
                    diet.expiration_date = diet.created_at + 1.month + 2.day
                    diet.save
                end
            end
        end
    end
end