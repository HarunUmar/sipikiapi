class User < ApplicationRecord
  belongs_to :spd
  belongs_to :jabatan
  belongs_to :eselon
  belongs_to :city
  validates_presence_of :spd_id,:jabatan_id,:eselon_id,:city_id,:fb,:token,:nama,:hp, :message => 'masih kosong'
end
