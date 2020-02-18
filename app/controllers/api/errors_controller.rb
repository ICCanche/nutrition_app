module API
    class ErrorsController < API::APIController
        def routing
            respond Error::NotFound.new
        end
    end
end