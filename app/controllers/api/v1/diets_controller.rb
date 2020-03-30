module API
    module V1
        class DietsController < APIController
            include Constants
            before_action :authenticate_user, :check_permissions

            def index
                diets = Diet.all.order(created_at: :desc)
                render json: diets, each_serializer: DietSerializer
            end

            def show
                diet = Diet.find(params[:id])
                render json: diet, serializer: DietDetailSerializer
            end

            def create
                #first step
                #customer requests a diet
                if current_user.customer.can_request_diet
                    diet = Diet.new
                    diet.price = DEFAULT_DIET_PRICE
                    diet.customer = current_user.customer
                    if diet.save
                        update_customer
                        render json: diet, serializer: DietSerializer
                    else
                        raise Error::UnprocessableEntity
                    end
                else
                    raise Error::CannotRequestDiet
                end
            end

            private

            def update_customer
                current_user.customer.can_request_diet = false
                current_user.customer.save
            end
        end
    end
end