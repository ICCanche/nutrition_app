module Error
    class NotFound < APIError
      def initialize(message = nil, title: nil, code: nil)
        super message || I18n.t('errors.route_not_found.detail'), 
        status: :not_found, 
        title: title || I18n.t('errors.route_not_found.title')
      end
    end
  end
  