module API
    module V1
        class PhysicalActivitiesController < APIController
            before_action :authenticate_user

            def index
                @physical_activities = PhysicalActivity.all
                render json: @physical_activities, each_serializer: PhysicalActivitySerializer
            end
        end
    end
end