class DisposisiSerializer < ActiveModel::Serializer
 require 'action_view'
 require 'action_view/helpers'
 
 include ActionView::Helpers::DateHelper
  attributes :id,:user_id,:kinerja_id,:judul,:isi,:ket,:deadline , :batas_waktu, :waktu_buat, :status, :created_at 
  has_many :gambar_disposisi
  has_many :disposisi_balasan
  has_many :user_disposisi

  def batas_waktu
    distance_of_time_in_words(Time.now, object.deadline)
  end

  def waktu_buat
  	time_ago_in_words(object.created_at)
  end

end
