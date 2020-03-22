module API
    module V1
        class CustomersController < APIController
            before_action :authenticate_user, :check_permissions

            def create
                unless !Customer.where({user_id: current_user.id}).empty?
                    customer = Customer.new(create_customer_params)
                    customer.user_id = current_user.id
                    customer.imc = CalculationUtils.calculateIMC(params[:weight], params[:height])
                    customer.food_ids = params[:food_ids]
                    customer.goal_ids = params[:goal_ids]
                    customer.physical_activity_ids = params[:physical_activity_ids]
                    customer.is_completed = true
                    if customer.save
                        render json: customer, serializer: CustomerSerializer
                    else
                        raise Error::UnprocessableEntity
                    end
                else
                    raise Error::EntityAlreadyExists 
                end
            end

            private

            def create_customer_params
                params.require([:gender, :age, :occupation, :weight, :height, :daily_foods, :disease, :goal_ids, :physical_activity_ids, :food_ids])
                params[:food_ids] ||= []
                params.permit([:gender, :age, :occupation, :weight, :height, :daily_foods, :disease, :goal_ids, :physical_activity_ids, :food_ids, food_ids:[]])
            end
        end
    end
end