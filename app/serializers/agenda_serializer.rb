class AgendaSerializer < ActiveModel::Serializer
 require 'action_view'
 require 'action_view/helpers'
 
 include ActionView::Helpers::DateHelper
  attributes :id, :nama ,:fb,:user_id, :spd,:judul,:ket,:waktu, :batas_waktu, :lokasi, :lat, :lang,:waktu_buat, :status, :created_at ,:jumlah_penerima,:waktu_absen
  has_many :user_agenda
  #has_many :disposisi_balasan

  @tn = Time.now

  def batas_waktu


    t1 = Time.now
    t1.strftime("%Y-%m-%d %H:%M:%S")
    t2 = object.waktu 
    t3 = t2 + 2.hours
    t3.strftime("%Y-%m-%d %H:%M:%S")

    if(t1.to_s >= t3.to_s)
      object[:status] = 1 #selesai
      return "agenda telah selesai"


    else

      return distance_of_time_in_words(Time.now.strftime("%Y-%m-%d %H:%M:%S"), t3.strftime("%Y-%m-%d %H:%M:%S"))
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

  def waktu_absen
    
    t1 = Time.now
    t1.strftime("%Y-%m-%d %H:%M:%S")
    t2 = object.waktu
    t2.strftime("%Y-%m-%d %H:%M:%S")


    if t1.to_s >= t2.to_s and object.status == 0
      1
    else
      0

      end
  end
      

end
