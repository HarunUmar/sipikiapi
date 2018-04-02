class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :spd_id, :nama, :fb, :jabatan_id, :city_id
  has_many :user_disposisi
  
end
