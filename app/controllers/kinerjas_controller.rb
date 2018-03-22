class KinerjasController < ApplicationController

	def show_disposisi
		@disposisi = Disposisi.all
		render json: {'success' =>1, 'messege'=>@disposisi}
	end

	def create_disposi
		@disposisi = Disposisi.create(disposisi_params)
		if @disposisi.save
			render json: {'success' =>1, 'message' => 'data berhasil disimpan'},status: :ok
		else 
			render json: {'success' =>1, 'message' => 'terjadi kesalahan'},status: :ok
		end
	end

	private def disposisi_params
		params.permit(:user_id,:kinerja_id,:judul,:isi,:ket,:deadline)
	end
end
