module Error
    class APIErrorSerializer < ActiveModel::Serializer
      attributes :status, :error, :message
  
      def error
        object.title
      end
    end
  end
  