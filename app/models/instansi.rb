class Instansi < ApplicationRecord
	has_many :spd
	belongs_to :city
end
