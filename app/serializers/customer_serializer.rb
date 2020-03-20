class CustomerSerializer < ActiveModel::Serializer
    attributes :id, :gender, :age, :occupation, :weight, :height, :imc, :daily_foods, :disease, :is_completed
end