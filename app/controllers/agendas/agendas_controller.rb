class Agendas::AgendasController < ApplicationController
	before_action :set_content_type #, :only => [:create_disposisi, :create_disposisi_balasan]

	#show all disposisi
	def show_agenda
		@agenda = Agenda.joins(:user).where(:users => {:city_id => params[:city_id]}).order(id: :desc).limit(20)
		render json: @agenda
	end

	#created disposisi
	def create_agenda

	
		@agenda = Agenda.create(agenda_params)

		if params[:tujuan]
			if @agenda.save
			
			@agenda.save_user(params[:tujuan].split(','))
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
 
end
