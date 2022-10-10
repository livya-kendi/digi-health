class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :patient_id, :doctor_id, :start, :end, :reason
end
