module API
    module V1
        class CategoriesController < APIController
            def index
                @categories =  FoodCategory.all
                render json: @categories, each_serializer: FoodCategorySerializer
            end
        end
    end
end