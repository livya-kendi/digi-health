class RecordSerializer < ActiveModel::Serializer
  attributes :id, :last_record, :patient_id, :doctor_id, :medication
end
