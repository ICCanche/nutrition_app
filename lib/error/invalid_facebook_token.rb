module Error
    class InvalidFacebookToken < APIError
        def initialize(message = nil, title: nil, code: nil)
            super message || I18n.t('errors.invalid_facebook_token.detail'), 
            status: :bad_request, 
            title: title || I18n.t('errors.invalid_facebook_token.title')
        end
    end
end