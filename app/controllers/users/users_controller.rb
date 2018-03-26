class Users::UsersController < ApplicationController
	before_action :set_content_type #, :only => :create

	def index
		@user = User.all
		render json: {'success' =>1, 'message'=> @user}		
	end

	def create
		@user = User.create(params_users)
		if @user.save 
			render json: {'success' =>1, 'message' => 'data berhasil disimpan'},status: :ok
		else 
			render json: {'success' =>0, 'message' => @user.errors.full_messages},status: :ok
		end

	end



	def cek_daftar
		@user = User.where(fb: params[:id_fb])
		if @user.empty?
			render json: {'success' => 0}	
		
		else 
			render json: {'success' => 1}	
		
		end	
	end

	private def params_users
		
    	params.permit(:spd_id,:jabatan_id,:eselon_id,:city_id,:fb,:token,:nama,:hp,:status)
 
	end

	private def set_content_type
 			
 		headers['Content-Type'] = 'multipart/form-data'
 		
 	end


	def in_spd
		@user = User.where(spd_id: params[:spd_id]).order(:eselon_id)
		render json: @user
	end


end
