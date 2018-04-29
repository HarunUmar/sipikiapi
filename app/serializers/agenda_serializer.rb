class AgendaSerializer < ActiveModel::Serializer
 require 'action_view'
 require 'action_view/helpers'
 
 include ActionView::Helpers::DateHelper
  attributes :id, :nama ,:fb,:user_id, :spd,:judul,:ket,:waktu, :batas_waktu, :lokasi, :lat, :lang,:waktu_buat, :status, :created_at ,:jumlah_penerima
  has_many :user_agenda
  #has_many :disposisi_balasan


  def batas_waktu
    if(Time.now  > object.waktu + 2.hours)
      object[:status] = 1 #selesai
      return "agenda telah selesai"
    else
      return distance_of_time_in_words(Time.now, object.waktu - 6.hours)
  end

  end

  def waktu_buat
  	time_ago_in_words(object.created_at)
  end

  def fb 
    object.user.fb
  end
  def nama
      object.user.nama
  end

  def spd
      object.user.pemkot.spd.slice(:spd)
  end

  def jumlah_penerima
      object.user_agenda.length
  end




 


end
