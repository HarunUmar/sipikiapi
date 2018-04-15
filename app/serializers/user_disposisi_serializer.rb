class UserDisposisiSerializer < ActiveModel::Serializer
  attributes :id, :fb,:user_id, :nama, :nilai, :status, :gambar_disposisi, :user_disposisi
  belongs_to :disposisi
 
  

  def fb 
  	object.user.fb
  end

  def nama
  	object.user.nama
  end

  def gambar_disposisi
      object.disposisi.slice(:gambar_disposisi)
      
  end

  def user_disposisi

  	object.disposisi.slice(:user_disposisi)
  	
  end










end
