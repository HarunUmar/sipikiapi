class UsersController < ApplicationController

	def index
		@user = User.all
		render json: @user
	end

	def create
    	@user = User.new(user_params)
 	    if @user.save
  			render json: {'success' =>1, 'message' => 'data berhasil disimpan'},status: :ok
  		else 
  			render json: {'success' =>0, 'message' => 'data gagal disimpan'},status: :ok
  		end

	end
	def show
		
	end

 
	private def user_params
    	params.permit(:no_ktp,:nama,:hp,:url_foto,:username,:status,:skpd,:id_fb,:token_fb)
 	 end
end
