class UserSerializer < ActiveModel::Serializer
  has_many :posts
  attributes :id, :nama, :url_foto

  def posts
  	object.posts.limit(1).order(id: :desc)
  end
end
