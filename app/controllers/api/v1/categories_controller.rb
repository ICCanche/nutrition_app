module API
    module V1
        class CategoriesController < APIController
            before_action :authenticate_user

            def index
                @categories =  FoodCategory.all
                render json: @categories, each_serializer: FoodCategorySerializer
            end
        end
    end
end