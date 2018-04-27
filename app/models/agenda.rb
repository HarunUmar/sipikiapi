class Agenda < ApplicationRecord
  belongs_to :kinerja
  belongs_to :user
  has_many :user_agenda
  validates_presence_of :user_id,:kinerja_id,:judul,:ket,:lat,:lang,:waktu,:lokasi ,:message => 'masih kosong'


  def save_user(params)
	params.each do |user | self.user_agenda.create(:user_id => user, :nilai => 0) end
end
end
