module Error
    module DefaultHandling
      def self.included(cls)
        cls.class_eval do
          # WARNING
          # Avoid setting rescue_from Exception/StandardError since it will override your
          # own custom rescue_from handlers https://stackoverflow.com/a/9121054/3287738
          # WARNING
        rescue_from Koala::Facebook::AuthenticationError do |e|
          respond InvalidFacebookToken.new
        end

        rescue_from ActionController::RoutingError do |e|
         respond NotFound.new  e.message,
                                  detail: { failures: e.failures }
        end

        rescue_from ActionController::ParameterMissing do |e|
          respond MissingParameter.new e.message, param: e.param
        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          respond NotFound.new e.message
        end

        rescue_from Forbidden do |e|
          respond Forbidden.new
        end

        rescue_from CannotRequestDiet do |e|
          respond CannotRequestDiet.new
        end
        
        rescue_from EntityAlreadyExists do |e|
          respond EntityAlreadyExists.new
        end

        rescue_from UnprocessableEntity do |e|
          respond UnprocessableEntity.new
        end     

      rescue_from InvalidDietStatus do |e|
        respond InvalidDietStatus.new
      end
        
        #STRIPE
        rescue_from Stripe::InvalidRequestError do |e|
          respond UnprocessableEntity.new e.message
        end
        
        rescue_from Stripe::CardError do |e|
          respond UnprocessableEntity.new e.message
        end

        end

        def respond(error)
          render json: error,
                 status: error.status,
                 serializer: APIErrorSerializer,
                 adapter: :json,
                 root: 'error'
        end
        
        def respond_common_error(error)
          render json: error,
                status: error.status,
                adapter: :json,
                serializer: ErrorSerializer
        end
      end
    end
  end
  