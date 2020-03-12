module API
  module V1
    class FacebookUserTokenController < APIController

      before_action :authenticate
    
      def create
        render json: auth_token, status: :created
      end
    
      private
    
      def authenticate
        unless entity.present?
          raise Knock.not_found_exception_class
        end
      end
    
      def auth_token
        if entity.respond_to? :to_token_payload
          Knock::AuthToken.new payload: entity.to_token_payload
        else
          Knock::AuthToken.new payload: { sub: entity.id }
        end
      end
    
      def entity
        @entity ||=
            FacebookService.fetch_data params[:access_token] do |facebookData| 
              User.find_or_create_by uid: facebookData["id"] do |user|
                user.first_name = facebookData["first_name"]
                user.last_name = facebookData["last_name"]
                user.profile_picture = facebookData["picture"]["data"]["url"]
                user.email = facebookData["email"]
                user.uid = facebookData["id"]
              end
            end
      end
    end
  end
end