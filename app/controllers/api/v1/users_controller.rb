module API
    module V1
        class UsersController < APIController
            before_action :authenticate_user

            def current
                @user = current_user
                render json: @user, each_serializer: UserSerializer
            end
        end
    end
end