class User < ApplicationRecord
	has_many :posts
	validates_presence_of :no_ktp,:nama,:id_fb,:token_fb,:hp,:username,:url_foto,:message => 'masih kosong'
end
