class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :image_url, :description, :location
end
