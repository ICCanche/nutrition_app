module API
    module V1
        class DietsController < APIController
            before_action :authenticate_user, :check_permissions

            def index
                diets = Diet.all.order(created_at: :desc)
                render json: diets, each_serializer: DietSerializer
            end

            def show
                diet = Diet.find(params[:id])
                render json: diet, serializer: DietDetailSerializer
            end
        end
    end
end