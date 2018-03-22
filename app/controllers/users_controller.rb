class UsersController < ApplicationController

	def index
		@user = User.all
		render json: {'success' =>1, 'message'=> @user}		
	end

	def create
		@user = User.create(params_users)
		if @user.save 
			render json: {'success' =>1, 'message' => 'data berhasil disimpan'},status: :ok
		else 
			render json: {'success' =>0, 'message' => 'terjadi kesalahan'},status: :ok
		end

	end

	private def params_users
		
    	params.permit(:spd_id,:jabatan_id,:eselon_id,:city_id,:fb,:token,:nama,:hp,:status)
 
	end


end
