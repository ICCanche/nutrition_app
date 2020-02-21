module API
    module V1
        class FoodsController < APIController
            before_action :authenticate_user
            
            def index
                if (params.has_key?(:category_id)) 
                    @foods = Food.where(food_category_id: params[:category_id])
                else
                    @foods = Food.all
                end 
                render json: @foods, each_serializer: FoodSerializer
            end
        end
    end
end