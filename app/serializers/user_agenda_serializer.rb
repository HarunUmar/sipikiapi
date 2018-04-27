class UserAgendaSerializer < ActiveModel::Serializer
  attributes :id, :fb,:user_id, :nama, :nilai, :status, :user_disposisi
  belongs_to :agenda
 
  

  def fb 
  	object.user.fb
  end

  def nama
  	object.user.nama
  end

  

  def user_disposisi

  	object.agenda.slice(:user_agenda)
  	
  end










end
