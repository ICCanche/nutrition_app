module Error
    class MissingParameter < APIError
        def initialize(message = nil, title: nil, code: nil, param: nil)
            super message ||I18n.t('errors.missing_parameter.detail') , 
                status: :unprocessable_entity, 
                title: title || I18n.t('errors.missing_parameter.title'),
                detail: { param: param.to_s.camelize(:lower) }
        end
    end
  end