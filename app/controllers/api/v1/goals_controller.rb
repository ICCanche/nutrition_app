module API
    module V1
        class GoalsController < APIController
            before_action :authenticate_user

            def index
                @goals = Goal.all
                render json: @goals, each_serializer: GoalSerializer
            end
        end
    end
end