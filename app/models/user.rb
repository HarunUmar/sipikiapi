class User < ApplicationRecord
  belongs_to :spd
  belongs_to :jabatan
  belongs_to :eselon
  belongs_to :city
  belongs_to :tingkat;
  has_many :user_disposisi
  has_many :disposisi

  validates_presence_of :spd_id,:jabatan_id, :nama,:eselon_id,:city_id,:tingkat_id,:fb,:token, :hp ,:message => 'masih kosong'


end
