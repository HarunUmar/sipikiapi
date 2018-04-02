class User < ApplicationRecord
  belongs_to :spd
  belongs_to :jabatan
  belongs_to :eselon
  belongs_to :city
  belongs_to :tingkat;
  has_many :user_disposisi
  has_many :disposisi

end
