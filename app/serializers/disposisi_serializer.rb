class DisposisiSerializer < ActiveModel::Serializer
 require 'action_view'
 require 'action_view/helpers'
 
 include ActionView::Helpers::DateHelper
  attributes :id, :nama ,:fb,:user_id, :spd ,:jabatan,:judul,:isi,:ket,:deadline , :batas_waktu, :waktu_buat, :status, :created_at ,:jumlah_penerima
  has_many :gambar_disposisi
  has_many :user_disposisi 
  #has_many :disposisi_balasan


  def batas_waktu
    if(Time.now > object.deadline)
      object[:status] = 1 #selesai
    else
      distance_of_time_in_words(Time.now, object.deadline)
     
    
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


  def jabatan
      object.user.jabatan.slice(:jabatan)
      
  end

  def spd
      object.user.spd.slice(:spd)
  end

  def jumlah_penerima
      object.user_disposisi.length
  end




 


end
