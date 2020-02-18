module Error
    class APIError < StandardError
        include ActiveModel::Serialization
        attr_reader :message, :title, :detail

        def initialize(message = I18n.t('errors.internal_server_error.detail'), 
              status: :internal_server_error,
              title: I18n.t('errors.internal_server_error.title'))
            @status = status
            @title = title
            @message = message
        end

            # returns the error as its hash representation
        def to_hash
          {
            message: message,
            status: status,
            error: error,
          }
        end
  
        def status
          Rack::Utils::SYMBOL_TO_STATUS_CODE[@status]
        end
    end
end