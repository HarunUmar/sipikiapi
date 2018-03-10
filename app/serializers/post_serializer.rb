class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id,:isi, :lat, :lng, :jenis, :comment_count, :love_count
  has_many :loveposts
  belongs_to :user 
  has_many :commentposts
 
 

  def renderuser
  @instance_options[:adduser]
  end

  def rendercommantpost
  	@instance_options[:addcommentpost]
  	
  end

  def renderlove
    false
  end

  def comment_count
  	object.commentposts.length
  end

  def love_count
    object.loveposts.length
  end
end
