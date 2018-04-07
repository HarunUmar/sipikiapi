class Kinerjas::KinerjasController < ApplicationController
	before_action :set_content_type #, :only => [:create_disposisi, :create_disposisi_balasan]

	#show all disposisi
	def show_disposisi
		@disposisi = Disposisi.joins(:user).where(:users => {:city_id => params[:city_id]}).order(id: :desc).limit(20)
		render json: @disposisi
	end

	#created disposisi
	def create_disposisi

	
		@disposisi = Disposisi.create(disposisi_params)

		if params[:tujuan]
			if @disposisi.save
			@disposisi.save_img(params[:picture]) if params[:picture]
			
			@disposisi.save_user(params[:tujuan].split(','))
			render json: {'success' =>1, 'message' => 'Goodluck'},status: :ok
		else 
			render json: {'success' =>0, 'message' => @disposisi.errors.full_messages},status: :ok
		end
		else

		   render json: {'success' =>0, 'message' => 'tujuan belum ditentukan'}
		end
			
	end


	#terima disposisi
	def terima_disposisi
	
		@terima_disposisi = Disposisi.find(params[:disposisi_id])
   		 if @terima_disposisi.update_attribute(:status, 1)
			render json: {'success' =>1, 'message' => 'Disposisi Telah Diterima'},status: :ok
		else 
			render json: {'success' =>0, 'message' => 'opss terjadi kesalahan'},status: :ok
		end
		
	end

	#akhiri disposisi
	def disposisi_selesai
	
		@terima_disposisi = Disposisi.find(params[:disposisi_id])

   		 if @terima_disposisi.update_attribute(:status, 2)
   		 	 @terima_disposisi.nilai_selesai()
			render json: {'success' =>1, 'message' => 'Disposisi telah selesai'},status: :ok
		else 
			render json: {'success' =>0, 'message' => 'opss terjadi kesalahan'},status: :ok
		end
		
	end

	#disposisi di tolak oleh atasan

	def tolak_disposisi
	
		@terima_disposisi = Disposisi.find(params[:disposisi_id])
   		 if @terima_disposisi.update_attribute(:status, 3)
   		 	 @terima_disposisi.nilai_tolak()
			render json: {'success' =>1, 'message' => 'anda tidak menyetujui disposisi ini'},status: :ok
		else 
			render json: {'success' =>0, 'message' => 'opss terjadi kesalahan'},status: :ok
		end
		
	end




	#created disposisi blasan
	def create_disposisi_balasan
		@disposisi_balasan = DisposisiBalasan.create(disposisi_balasan_params)
		if @disposisi_balasan.save
			@disposisi_balasan.save_img(params[:picture]) if params[:picture]

		
			render json: {'success' =>1, 'message' => 'Goodluck'},status: :ok
		else 
			render json: {'success' =>0, 'message' => @disposisi_balasan.errors.full_messages},status: :ok
		end
		
	end


	#show disposisi where user is created disposisi
	def show_disposisi_user
		@user = Disposisi.where(user_id: params[:user_id]).order(id: :desc).limit(20)
		render json: @user	
	end

	#show disposisi from other user
	def show_my_disposisi
		@user = UserDisposisi.where(user_id: params[:user_id]).order(id: :desc).limit(20)
		render json: @user	
	end

	#show disposisi user into spd
	def show_disposisi_spd

		@user = Disposisi.joins(:user).where(:users => {:spd_id => params[:spd_id]}).order(id: :desc).limit(20)
		render json:  @user 
	end

	def spd_structural
		@users  = User.where(spd_id: params[:spd_id]).where(city_id: params[:city_id]).order(:tingkat_id)
		render json: @users
		
	end

	#param request from client to table disposisi
	private def disposisi_params
		
		params.permit(:user_id,:kinerja_id,:judul,:isi,:ket,:deadline,:picture)
	end


	
	#param request from client to table disposisi_balasan
	private def disposisi_balasan_params
		params.permit(:user_id,:disposisi_id,:isi,:ket,:picture)
	end

	#set content type
	private def set_content_type
 			
 		headers['Content-Type'] = 'multipart/form-data'
 		
 	end
 
end
