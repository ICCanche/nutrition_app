module API
  class  APIController < ActionController::API
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    # protect_from_forgery with: :exception
    include Error::DefaultHandling
    include Knock::Authenticable
    include CheckPermission
  end
end