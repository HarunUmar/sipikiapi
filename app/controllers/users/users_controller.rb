class Users::UsersController < ApplicationController
	before_action :set_content_type , :only => :create

	def index
		@user = User.all
		render json: {'success' =>1, 'message'=> @user}		
	end

	def create
		@user = User.create(params_users)
		if @user.save
			render json: {'success' =>1, 'message' => @user,'spd_id' => @user.pemkot[:spd_id],'parent_unit' => @user.pemkot[:parent_unit]},status: :ok
		else 
			render json: {'success' =>0, 'message' => @user.errors.full_messages},status: :ok
		end

	end
	#cek user ready exist 
	def cek_daftar
		@user_daftar = User.where(fb: params[:id_fb])
		
			if @user_daftar.empty?
			render json: {'success' => 0, 'message' => 'Silihkan Register terlebih dahulu' }
			else 
				@user = @user_daftar.joins(:pemkot).first
			render json: {'success' =>1, 'message' => @user,'spd_id' => @user.pemkot[:spd_id],'parent_unit' => @user.pemkot[:parent_unit]},status: :ok
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
		@user = User.where(id: params[:user_id])
		#@user = User.joins(:user_disposisi).where(id: params[:id_user]).pluck('SUM(user_disposisis.nilai))', 'COUNT(user_disposisis.id)')
		render json: @user
	end
	private def params_users
		
    	params.permit(:pemkot_id,:eselon_id,:city_id,:fb,:token,:nama,:hp,:status)
 
	end

	private def set_content_type
 			
 		headers['Content-Type'] = 'multipart/form-data'
 		
 	end

	def spd_structural

		@users  = User.joins(:pemkot).select('users.id,users.pemkot_id,users.eselon_id,users.city_id,users.fb,users.nama,pemkots.pemkot').where(:pemkots => {spd_id: params[:spd_id], parent_unit: params[:parent_unit]}).where(city_id: params[:city_id]).order('pemkots.parent_daftar')
		render json: {'result' =>@users}
		
	end

	def notif
		@user = Notifikasi.joins(:user).select('users.id,users.nama,notifikasis.user_id,notifikasis.isi,notifikasis.tujuan, notifikasis.kode,notifikasis.created_at,notifikasis.fb').where(user_id: params[:user_id]).order(created_at: :desc).limit(20)
		render json: @user
	end


end
