class Instansi < ApplicationRecord
	has_many :spd
	has_many :jabatan;
	belongs_to :city

end
