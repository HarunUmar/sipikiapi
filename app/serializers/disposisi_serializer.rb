class DisposisiSerializer < ActiveModel::Serializer
 require 'action_view'
 require 'action_view/helpers'
 
 include ActionView::Helpers::DateHelper
  attributes :id, :nama ,:fb,:user_id, :spd,:judul,:isi,:ket,:deadline , :batas_waktu, :waktu_buat, :status, :created_at ,:jumlah_penerima
  has_many :gambar_disposisi
  has_many :user_disposisi 
  #has_many :disposisi_balasan


 

  def batas_waktu
    t1 = Time.now
    t1.strftime("%Y-%m-%d %H:%M:%S")
    t2 = object.deadline
    t2.strftime("%Y-%m-%d %H:%M:%S")
    if(t1.to_s >= t2.to_s)
      object[:status] = 1 #selesai
      return "disposisi telah selesai"
    else
      return distance_of_time_in_words(Time.now.strftime("%Y-%m-%d %H:%M:%S"), t2.strftime("%Y-%m-%d %H:%M:%S"))
  
  end

  end

  def deadline
     object.deadline.strftime("%Y-%m-%d %H:%M:%S")
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
      object.user_disposisi.length
  end




 


end
