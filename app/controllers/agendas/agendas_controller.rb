class Agendas::AgendasController < ApplicationController
	
	before_action :set_content_type #, :only => [:create_disposisi, :create_disposisi_balasan]
	before_action :cegah
	require('fcm')

	#show all disposisi

	@@fcm = FCM.new('AAAArfsMQFU:APA91bFD3Ix90VUsMuf4fVRgOkBbwgyZ6SPH-MBsY3WK-cGR-Y7ByFKe3smyR7a9cLF1xdIZjQnokztkYDPhuPLqzLoqP7QIbM23ytg2eeN6T2LTpIzgk-iWmPOcBuS7mrIlQzC9XL5V') 

	 
	def show_agenda
		@agenda = Agenda.joins(:user).where(:users => {:city_id => params[:city_id]}).order(id: :desc).limit(20)
		render json: @agenda
	end

	#created disposisi
	def create_agenda

     # @user = params[:tujuan].split(',')

     


     # @user_list = User.all
     
     # @order ||= []

     # 		 @user_list.each_with_index.map  do |id,nama|
  			# 		token
		   #   end


  

		   #   render json: @wah

	
		#response = @@fcm.send_to_topic("GLOBAL",options)
		@agenda = Agenda.create(agenda_params)
		if params[:tujuan]
			if @agenda.save
			@user = params[:tujuan].split(',')
			@token = params[:token].split(',')
			if @agenda.save_user(@user)
				@user.each do |parent|
  					Notifikasi.create(user_id: parent , isi: 'Menambahkan Agenda Untuk Anda', kode: 2,tujuan: @agenda[:id], fb: params[:fb])					
				end
			end

			params_fcm('SIPiki Agenda','Agenda Baru Untuk Anda','http://setda-bitung.org/agenda.jpeg',2)
			render json: {'success' =>1, 'message' => 'Agenda telah ditambahkan'},status: :ok
		else 
			render json: {'success' =>0, 'message' => @agenda.errors.full_messages},status: :ok
		end
		else

		   render json: {'success' =>0, 'message' => 'tujuan belum ditentukan'}
		end
			
	end


	#terima disposisi
	def absen
	
		@agenda = UserAgenda.where(user_id: params[:user_id]).where(agenda_id: params[:agenda_id])
   		 #
   		if @agenda[0][:status] == 0

   		 	if @agenda.update(status: 1, nilai: 100)
				render json: {'success' =>1, 'message' => 'Terima kasih'},status: :ok
			else 
				render json: {'success' =>0, 'message' => 'opss terjadi kesalahan'},status: :ok
			end

		else

		render json: {'success' =>1, 'message' => 'anda telah melalukan absen'},status: :ok
	end
	end

	#show disposisi where user is created disposisi
	def show_agenda_user
		@agenda = Agenda.where(user_id: params[:user_id]).order(id: :desc).limit(20)
		render json: @agenda
	end

	#show disposisi from other user
	def show_my_agenda
		@agenda = UserAgenda.where(user_id: params[:user_id]).order(id: :desc).limit(20)
		render json: @agenda
	end
	

	def details_agenda
		@agenda = Agenda.where(id: params[:agenda_id])
		render json: @agenda
	end

	def details_my_agenda
		@agenda = UserAgenda.where(user_id: params[:user_id]).where(agenda_id: params[:agenda_id])
			render json: @agenda
	end


	def details_user_agenda
		@agenda = Agenda.where(user_id: params[:user_id]).where(id: params[:agenda_id])
			render json: @agenda
	end

	#param request from client to table disposisi
	private def agenda_params
		params.permit(:user_id,:kinerja_id,:judul,:ket,:lat,:lang,:waktu,:lokasi)
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
