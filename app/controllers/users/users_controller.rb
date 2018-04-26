class Users::UsersController < ApplicationController
	before_action :set_content_type , :only => :create

	def index
		@user = User.all
		render json: {'success' =>1, 'message'=> @user}		
	end

	def create


	@userx = User.where(fb: params[:fb])
	
	
		@user = User.create(params_users)
		if @user.save
			render json: {'success' =>1, 'message' => @user,'spd_id' => @user.pemkot[:spd_id]},status: :ok
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
			# city_id = params[:city_id]
			# dari = params[:pemkot_id]
			# @user = Pemkot.joins(:user).select(:city_id, :nama).where(:users => {:city_id => 1})
			@user = Pemkot.joins(:user).select(:fb,:nama, :pemkot,'users.id').where(:users => {:city_id => params[:city_id]}).where(:group => Rule.select(:tujuan).where(:dari => Pemkot.select('pemkots.group').where(:pemkots =>{id: params[:pemkot_id]}))).order(:spd_id)
		#select rules.tujuan FROM rules WHERE dari IN (select pemkots.group from pemkots where id='20')
		#select rules.tujuan FROM rules WHERE dari IN (select pemkots.group from pemkots where id='20')
		# 		WHERE users.city_id = #{city_id} and pemkots.group IN (SELECT tujuan FROM rules WHERE dari = #{dari})"
		# @user = ActiveRecord::Base.connection.execute(sql)
			render json: @user

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
