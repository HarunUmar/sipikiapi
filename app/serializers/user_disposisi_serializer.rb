class UserDisposisiSerializer < ActiveModel::Serializer
  attributes :id, :fb,:user_id, :nama, :nilai, :status
  belongs_to :disposisi
 
  

  def fb 
  	object.user.fb
  end

  def nama
  	object.user.nama
  end
end
