class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :first_name, :last_name, :profile_picture, :is_completed
end