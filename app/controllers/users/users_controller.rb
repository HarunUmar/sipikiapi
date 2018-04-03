class Users::UsersController < ApplicationController
	before_action :set_content_type , :only => :create

	def index
		@user = User.all
		render json: {'success' =>1, 'message'=> @user}		
	end

	def create
		@user = User.create(params_users)
		if @user.save 
			render json: {'success' =>1, 'message' => @user},status: :ok
		else 
			render json: {'success' =>0, 'message' => @user.errors.full_messages},status: :ok
		end

	end



	#cek user ready exist and cek version app
	def cek_daftar
		@user = User.where(fb: params[:id_fb])
		if @user.empty?
			render json: {'success' => 0, 'message' => 'Maaf, lengkapi dulu data anda'}	
		
		else 

			if @user[0][:status] == 1
					if params[:version]  == "V1"
						render json: {'success' => 1, 'message' => 'welcome back ' + @user[0][:nama]}	
					else 
						render json: {'success' => 0, 'message' => 'Update versi Sipiki anda'}

					end

			else
				render json: {'success' => 0, 'message' => 'Maaf akun anda belum aktif' }

			end
		
		end	
	end

	#get user tujuan disposisi 
	def tujuan_disposisi

=begin


SELECT haks.tingkat_id, tingkats.tingkat,haks.hak,users.nama,users.id ,spds.spd
FROM tingkats  
INNER JOIN haks  ON haks.hak = tingkats.id   
INNER JOIN users ON haks.hak = users.tingkat_id 
INNER JOIN spds  ON users.spd_id = spds.id
where haks.tingkat_id= 4 and users.city_id =1

=end

	@tujuan = Tingkat.select(
  [
    Hak.arel_table[:tingkat_id], Tingkat.arel_table[:tingkat], User.arel_table[:nama], User.arel_table[:id], Spd.arel_table[:spd]
  ]
).where(
  Hak.arel_table[:tingkat_id].eq(params[:tingkat_id]).and(User.arel_table[:city_id].eq(params[:city_id]))
).joins(
  Tingkat.arel_table.join(Hak.arel_table).on(Hak.arel_table[:hak].eq(Tingkat.arel_table[:id])).join_sources
).joins(
  Tingkat.arel_table.join(User.arel_table).on(
    Hak.arel_table[:hak].eq(User.arel_table[:tingkat_id])
  ).join_sources
).joins(
  Tingkat.arel_table.join(Spd.arel_table).on(User.arel_table[:spd_id].eq(Spd.arel_table[:id])).join_sources
)

		render json: @tujuan
		
	end



	private def params_users
		
    	params.permit(:spd_id,:jabatan_id,:eselon_id,:city_id, :tingkat_id,:fb,:token,:nama,:hp,:status)
 
	end



	private def set_content_type
 			
 		headers['Content-Type'] = 'multipart/form-data'
 		
 	end


	def in_spd
		@user = User.where(spd_id: params[:spd_id]).order(:eselon_id)
		render json: @user
	end


end
