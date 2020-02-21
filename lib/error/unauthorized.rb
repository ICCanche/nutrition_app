module Error
    class Unauthorized < APIError 
        def initialize(message = nil, title: nil, code: nil)
            super message || I18n.t('errors.not_authorized.detail'), 
            status: :unauthorized, 
            title: title || I18n.t('errors.not_authorized.title')
        end
    end
end