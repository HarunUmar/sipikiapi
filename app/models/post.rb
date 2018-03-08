class Post < ApplicationRecord
	belongs_to :user
	has_many :commentposts
	validates_presence_of :isi,:lat,:lng,:message => 'masih kosong'

end
