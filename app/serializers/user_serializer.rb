class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :first_name, :last_name, :profile_picture
    has_one                        :customer, include_nested_associations: true
end