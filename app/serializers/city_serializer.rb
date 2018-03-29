class CitySerializer < ActiveModel::Serializer
  attributes :id, :city
  has_many :instansi
  belongs_to :provinsi
end
