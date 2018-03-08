class PostSerializer < ActiveModel::Serializer
  attributes :id, :isi, :lat, :lng, :jenis
  belongs_to :user
  has_many :commentposts
end
