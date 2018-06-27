class Kinerjas::KinerjasController < ApplicationController
	before_action :set_content_type #, :only => [:create_disposisi, :create_disposisi_balasan]
	before_action :cegah
	require('fcm')

	@@fcm = FCM.new('AAAArfsMQFU:APA91bFD3Ix90VUsMuf4fVRgOkBbwgyZ6SPH-MBsY3WK-cGR-Y7ByFKe3smyR7a9cLF1xdIZjQnokztkYDPhuPLqzLoqP7QIbM23ytg2eeN6T2LTpIzgk-iWmPOcBuS7mrIlQzC9XL5V') 

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
			
			@user = params[:tujuan].split(',')
			@token = params[:token].split(',')
			if @disposisi.save_user(@user)
				@user.each do |parent|
  					Notifikasi.create(user_id: parent ,  isi: 'Menambahkan Disposisi Untuk Anda', kode: 1, tujuan: @disposisi[:id], fb: params[:fb])
				end
			end
			params_fcm('SIPiki Disposisi','Disposisi Baru Untuk Anda','http://156.67.217.19/disposisi.png',1)
			render json: {'success' =>1, 'message' => 'Disposisi telah di tambahkan'},status: :ok
		else 
			render json: {'success' =>0, 'message' => @disposisi.errors.full_messages},status: :ok
		end
		else

		   render json: {'success' =>0, 'message' => 'tujuan belum ditentukan'}
		end
			
	end


	#terima disposisi
	def terima_disposisi
	
		@terima_disposisi = UserDisposisi.where(user_id: params[:user_id]).where(disposisi_id: params[:disposisi_id])
   		 #
		if @terima_disposisi.update(status: 1, nilai: 20)
				render json: {'success' =>1, 'message' => 'Disposisi Telah Diterima'},status: :ok
		else 
			render json: {'success' =>0, 'message' => 'opss terjadi kesalahan'},status: :ok
		end
		
	end

	#akhiri disposisi
	def disposisi_selesai
	
		@disposisi_selesai= UserDisposisi.where(user_id: params[:user_id]).where(disposisi_id: params[:disposisi_id])
   		 #
		if @disposisi_selesai.update(status: 2)
				render json: {'success' =>1, 'message' => 'Silahkan tunggu info selanjutnya'},status: :ok
		else 
			render json: {'success' =>0, 'message' => 'opss terjadi kesalahan'},status: :ok
		end
		
	end


	#akhiri disposisi
	def beri_nilai_disposisi
	
		@disposisi_nilai= UserDisposisi.where(user_id: params[:user_id]).where(disposisi_id: params[:disposisi_id])
   		 #
		if @disposisi_nilai.update(status: 4, nilai: params[:nilai])
				render json: {'success' =>1, 'message' => 'Disposisi telah selesai'},status: :ok
		else 
			render json: {'success' =>0, 'message' => 'opss terjadi kesalahan'},status: :ok
		end
		
	end


	#disposisi di tolak oleh atasan

	def tolak_disposisi
	
		
		@tolak_disposisi = UserDisposisi.where(user_id: params[:user_id]).where(disposisi_id: params[:disposisi_id])
   		 #
		if @tolak_disposisi.update(status: 3, nilai: 0)
				render json: {'success' =>1, 'message' => 'Disposisi ditolak'},status: :ok
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

		#@user = UserDisposisi.joins(:user).where(:users => {:spd_id => params[:spd_id]}).order(id: :desc).limit(20)
		@user = UserDisposisi.joins(user: :pemkot).where(:pemkots => {spd_id: params[:spd_id]}).order(id: :desc).limit(20)
		render json:  @user 
	end

	

	def details_disposisi
		@disposisi = Disposisi.where(id: params[:disposisi_id])
		render json: @disposisi
	end

	def details_my_disposisi
		@disposisi = UserDisposisi.where(user_id: params[:user_id]).where(disposisi_id: params[:disposisi_id])
			render json: @disposisi
	end


	def details_user_disposisi
		@disposisi = Disposisi.where(user_id: params[:user_id]).where(id: params[:disposisi_id])
			render json: @disposisi
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

 	def params_fcm(title,message,image,jenis)
 		@title = title
 		@message = message
 		@image = image
 		@jenis = jenis
 		@timestamp = Time.new.strftime("%Y-%m-%d %H:%M:%S")

 		@@fcm.send(@token,options)
 		
 	end

 	




 	 def options
 	 	
        {
          priority: 'high',
          data: {

            
            "data": {
            "title": @title,
            "message": @message,   
            "is_background": false,
            "image": @image,
            "timestamp": @timestamp,
            "jenis": @jenis,
                "payload":{"team":"Indo","score":"9.9"}
           
            }
            
        }
          
        }
      end
 
 
	def cegah

 		 @header  = request.headers['Authorization']
 		 @acak = Digest::MD5.hexdigest(@header)
 		if(@acak != 'd2983dc162a6f10365841dfd34584790')
 		 	render status: 309
 		end
 
 	end
end
