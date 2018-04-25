class Pemkot < ApplicationRecord
	has_many :user
	belongs_to :spd
end
