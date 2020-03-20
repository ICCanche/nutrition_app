module API
    module V1
        class CustomersController < APIController
            before_action :authenticate_user, :check_permissions

            def create
                unless !Customer.where({user_id: current_user.id}).empty?
                    customer = Customer.new(create_customer_params)
                    customer.user_id = current_user.id
                    customer.imc = CalculationUtils.calculateIMC(params[:weight], params[:height])
                    if customer.save
                        update_user_completion
                        render json: customer, serializer: CustomerSerializer
                    else
                        raise Error::UnprocessableEntity
                    end
                else
                    raise Error::EntityAlreadyExists 
                end
            end

            private

            def update_user_completion
                current_user.is_completed = true
                current_user.save
            end

            def create_customer_params
                params.require([:gender, :age, :occupation, :weight, :height, :daily_foods, :disease])
                params.permit([:gender, :age, :occupation, :weight, :height, :daily_foods, :disease])
            end
        end
    end
end