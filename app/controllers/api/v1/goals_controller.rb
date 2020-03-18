module API
    module V1
        class GoalsController < APIController
            def index
                @goals = Goal.all
                render json: @goals, each_serializer: GoalSerializer
            end
        end
    end
end