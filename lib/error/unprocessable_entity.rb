module Error
    class UnprocessableEntity < APIError
      def initialize(message = nil, title: nil, code: nil)
        super message || I18n.t('errors.unprocessable_entity.detail'), 
        status: :unprocessable_entity, 
        title: title || I18n.t('errors.unprocessable_entity.title')
      end
    end
  end