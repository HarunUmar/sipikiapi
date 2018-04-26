	class UserSerializer < ActiveModel::Serializer

	has_many :user_disposisi
	attributes :id, :fb, :nama, :fb, :city_id, :jumlah_disposisi, :total_nilai
	

	def jumlah_disposisi
		object.user_disposisi.length
		
	end



	def total_nilai
		@nilai = object.user_disposisi.sum(:nilai).to_f
		@hasil = @nilai /jumlah_disposisi.to_f 
		return @hasil.to_f
	end

end