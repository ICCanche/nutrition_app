class CustomerSerializer < ActiveModel::Serializer
    attributes :id, :gender, :age, :occupation, :weight, :height, :imc, :daily_foods, :disease, :is_completed
    has_many                        :foods, include_nested_associations: true
    has_many                        :goals, include_nested_associations: true
    has_many                        :physical_activities, include_nested_associations: true
end