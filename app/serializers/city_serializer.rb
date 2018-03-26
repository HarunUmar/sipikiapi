class CitySerializer < ActiveModel::Serializer
  attributes :id, :city
  belongs_to :provinsi
end
