module API
    module V1
        class CustomersController < APIController
            before_action :authenticate_user, :check_permissions

            def create
                unless !Customer.where({user_id: current_user.id}).empty?
                    @customer = Customer.new(create_customer_params)
                    @customer.user_id = current_user.id
                    @customer.is_completed = true
                    @customer.imc = CalculationUtils.calculateIMC(params[:weight], params[:height])
                    if @customer.save
                        render json: @customer, serializer: CustomerSerializer
                    else
                        raise Error::UnprocessableEntity
                    end
                else
                    raise Error::EntityAlreadyExists 
                end
            end

            private

            def create_customer_params
                params.require([:gender, :age, :occupation, :weight, :height, :daily_foods, :disease])
                params.permit([:gender, :age, :occupation, :weight, :height, :daily_foods, :disease])
            end
        end
    end
end