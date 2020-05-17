module Error
    class InvalidDietStatus < UnprocessableEntity
      def initialize(message = nil, title: nil, code: nil)
        super I18n.t('errors.invalid_diet_status.detail'), 
        title: I18n.t('errors.invalid_diet_status.title')
      end
    end
  end