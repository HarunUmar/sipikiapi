	class UserSerializer < ActiveModel::Serializer

	has_many :user_disposisi
	has_many :user_agenda
	attributes :id, :fb, :nama, :fb, :city_id, :jumlah_disposisi, :jumlah_agenda,:total_nilai, 
	

	def jumlah_disposisi
		object.user_disposisi.length
		
	end
	def jumlah_agenda
		object.user_agenda.length
	end



	def total_nilai
		# @nilai = object.user_agenda.sum(:nilai).to_f
		# @hasil = @nilai /jumlah_disposisi.to_f 
		@nilai_agenda = object.user_agenda.sum(:nilai).to_f / jumlah_agenda.to_f
		@nilai_disposisi = object.user_disposisi.sum(:nilai).to_f / jumlah_disposisi.to_f
		@hasil = @nilai_agenda.to_f + @nilai_disposisi.to_f
		@hasil_akhir = @hasil / 2

		if @hasil_akhir >0
			return @hasil_akhir
		else
		
			return 0
		end
	end



	def user_agenda
		object.user_agenda.order(id: :desc)
	end


	def user_disposisi
		object.user_disposisi.order(id: :desc)
	end





end