class CustomerSerializer < ActiveModel::Serializer
    attributes :id, :gender, :age, :occupation, :weight, :height, :imc, :daily_foods, :disease, :is_completed, :can_request_diet
    has_many                        :foods, include_nested_associations: true
    has_many                        :goals, include_nested_associations: true
    has_many                        :physical_activities, include_nested_associations: true

    def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
        super(adapter_options, options, adapter_instance).select { |_, v| v }
    end
end