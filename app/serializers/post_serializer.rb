class PostSerializer < ActiveModel::Serializer
  attributes :id, :isi, :lat, :lng
  belongs_to :user
  has_many :commentposts
end
