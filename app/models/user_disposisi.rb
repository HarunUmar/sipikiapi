class UserDisposisi < ApplicationRecord
  belongs_to :user
  belongs_to :disposisi
  has_many :disposisi_balasan
  
=begin

def nilai_selesai()
	self.user_disposisi.update(:nilai => "100",:status => 2)
	
end

def nilai_tolak()
	self.user_disposisi.update(:nilai => "0", :status => 3)
	
end

def nilai_terima()
  user_disposisi.update(:nilai => "20", :status => 1)
  
end

=end

end
