module Error
    class Forbidden < APIError 
        def initialize(message = nil, title: nil, code: nil)
            super message || I18n.t('errors.forbidden.detail'), 
            status: :forbidden, 
            title: title || I18n.t('errors.forbidden.title')
        end
    end
end