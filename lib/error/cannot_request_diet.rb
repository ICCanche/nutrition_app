module Error
    class CannotRequestDiet < APIError
        def initialize(message = nil, title: nil, code: nil)
            super message || I18n.t('errors.cannot_request_diet.detail'), 
            status: :bad_request, 
            title: title || I18n.t('errors.cannot_request_diet.title')
        end
    end
end