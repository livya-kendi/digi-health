class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age, :image_url, :location
end
