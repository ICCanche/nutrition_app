module API
    module V1
        class CustomersController < APIController
            before_action :authenticate_user, :check_permissions

            def create
                customer = Customer.where({user_id: current_user.id}).first
                status = 200
                unless !customer.nil?
                    newCustomer = Customer.new(create_customer_params)
                    newCustomer.user_id = current_user.id
                    newCustomer.imc = CalculationUtils.calculateIMC(params[:weight], params[:height])
                    newCustomer.food_ids = params[:food_ids]
                    newCustomer.goal_ids = params[:goal_ids]
                    newCustomer.physical_activity_ids = params[:physical_activity_ids]
                    newCustomer.is_completed = true
                    stripeCustomer = StripeService.createCustomer(current_user)
                    newCustomer.stripe_customer_id = stripeCustomer.id
                    if newCustomer.save
                        customer = newCustomer
                        status = 201
                    else
                        raise Error::UnprocessableEntity
                    end
                end
                render json: customer, serializer: CustomerSerializer, status: status
            end

            private

            def create_customer_params
                params.require([:gender, :age, :occupation, :weight, :height, :daily_foods, :goal_ids, :physical_activity_ids, :food_ids])
                params[:food_ids] ||= []
                params.permit([:gender, :age, :occupation, :weight, :height, :daily_foods, :disease, :goal_ids, :physical_activity_ids, :food_ids, food_ids:[]])
            end
        end
    end
end