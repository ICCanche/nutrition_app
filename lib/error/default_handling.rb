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
  