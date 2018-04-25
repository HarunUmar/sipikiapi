class Users::UsersController < ApplicationController
	before_action :set_content_type , :only => :create

	def index
		@user = User.all
		render json: {'success' =>1, 'message'=> @user}		
	end

	def create
		@user = User.create(params_users)
		if @user.save
			@user.pemkot[:spd_id];
			render json: {'success' =>1, 'message' => @user ,'spd_id' => @user.pemkot[:spd_id]},status: :ok
		else 
			render json: {'success' =>0, 'message' => @user.errors.full_messages},status: :ok
		end

	end


	#cek user ready exist 
	def cek_daftar
		@user = User.where(fb: params[:id_fb])
		
			if @user[0][:status] == 0
			render json: {'success' => 3, 'message' => 'Maaf akun anda belum aktif' }
			else 
			render json: {'success' => 2, 'nama' => @user[0][:nama], 'data' => @user}
			end			
	end

	def update_token
		@user = User.where(id: params[:user_id])
		if @user.update(token: params[:token])

		end
		
	end

	def tujuan

		
	end

	#get user tujuan disposisi 
	def user_in_room


=begin

SELECT haks.tingkat_id, tingkats.tingkat,haks.hak,users.nama,users.id ,spds.spd, jabatans.jabatan
FROM tingkats  
INNER JOIN haks  ON haks.hak = tingkats.id   
INNER JOIN users ON haks.hak = users.tingkat_id 
INNER JOIN spds  ON users.spd_id = spds.id
INNER JOIN jabatans ON users.jabatan_id = jabatans.id
where users.id != 1 and users.spd_id = 1 and haks.tingkat_id= 4 and users.city_id =1 
=end


	end



	def profile
		@user = User.find(params[:id_user])
		render json: @user
		
	end

	private def params_users
		
    	params.permit(:pemkot_id,:eselon_id,:city_id, :tingkat_id,:fb,:token,:nama,:hp,:status)
 
	end

	private def set_content_type
 			
 		headers['Content-Type'] = 'multipart/form-data'
 		
 	end

	def spd_structural
		@users  = User.where(spd_id: params[:spd_id]).where(city_id: params[:city_id]).order(:tingkat_id)
		render json: @users
		
	end


end
