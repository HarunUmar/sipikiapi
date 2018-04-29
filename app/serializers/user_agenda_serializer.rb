class UserAgendaSerializer < ActiveModel::Serializer
  attributes :id, :fb,:user_id, :nama, :nilai, :status, :user_agenda
  belongs_to :agenda
 
  

  def fb 
  	object.user.fb
  end

  def nama
  	object.user.nama
  end

  

  def user_agenda

  	object.agenda.slice(:user_agenda)
  	
  end

end
