class ProvinsiSerializer < ActiveModel::Serializer

  attributes :id,:provinsi,:status
  has_many :city
  

end