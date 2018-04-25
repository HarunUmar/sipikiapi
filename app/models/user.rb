class User < ApplicationRecord

  belongs_to :eselon
  belongs_to :city
  belongs_to :pemkot
  has_many :user_disposisi
  has_many :disposisi



  validates_presence_of :pemkot_id,
  						:eselon_id,
  						:city_id,
  						:nama,
  						:fb,
  						:token,
  						:hp ,
  						:message => 'masih kosong'


end
