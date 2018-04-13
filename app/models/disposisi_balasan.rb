class DisposisiBalasan < ApplicationRecord
  belongs_to :user_disposisi
  has_many :gambar_disposisi_balasan
  attr_accessor :picture
  validates_presence_of :user_id,:disposisi_id,:isi,:ket ,:message => 'masih kosong'


def save_img(params)
	params.each { |img|
 	    		self.gambar_disposisi_balasan.create(:picture => img)}
end


end
