class DietSerializer < ActiveModel::Serializer
    attributes :id, :name, :status, :recommendations, :created_at, :expiration_date
end