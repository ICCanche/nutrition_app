module Error
    class EntityAlreadyExists < APIError
      def initialize(message = nil, title: nil, code: nil)
        super message || I18n.t('errors.entity_already_exists.detail'), 
        status: :conflict, 
        title: title || I18n.t('errors.entity_already_exists.title')
      end
    end
  end