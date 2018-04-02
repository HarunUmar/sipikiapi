class Disposisi < ApplicationRecord
  belongs_to :user
  belongs_to :kinerja
  has_many :gambar_disposisi
  has_many :user_disposisi
  has_many :disposisi_balasan
  attr_accessor :picture
  validates_presence_of :user_id,:kinerja_id,:judul,:isi,:ket,:deadline ,:message => 'masih kosong'


def save_img(params)
	params.each { |img|
 	    		self.gambar_disposisi.create(:picture => img)}
end

def save_user(params)
	params.each do |user | self.user_disposisi.create(:user_id => user, :nilai => 0, :status => 0) end
end

def nilai_selesai()
	self.user_disposisi.update(:nilai => "100",:status => 1)
	
end

def nilai_tolak()
	self.user_disposisi.update(:nilai => "0", :status => 0)
	
end




end
