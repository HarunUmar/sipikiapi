class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id,:isi, :lat, :lng, :jenis, :comment_count, :love_count, :img_count
 
 has_many :loveposts, if: ->{:renderlove}
 belongs_to :user , if:-> {:renderuser}
has_many :commentposts, if: ->{:rendercommantpost}
 has_many :gambarposts
 

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

   def img_count
    object.gambarposts.length
  end




end
