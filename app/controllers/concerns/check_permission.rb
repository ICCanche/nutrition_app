module CheckPermission extend ActiveSupport::Concern
    def check_permissions
        unless current_user.customer?
            raise Error::Forbidden
        end
    end
end