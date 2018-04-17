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
				if params[:version] != "V1"
			render json: {'success' => 0, 'message' => 'Maaf, Update dulu versi Sipiki anda'}	
		
		else 

			if @user.empty? 
					render json: {'success' => 1, 'message' => 'silahkan lengkapi data dengan sebernarnya'}
			else 

				if @user[0][:status] == 1
					render json: {'success' => 2, 'nama' => @user[0][:nama], 'data' => @user}	
				else
				  render json: {'success' => 3, 'message' => 'Maaf akun anda belum aktif' }
				end
			end
		end
					


				

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

	@tujuan = Tingkat.select(
  [
    Tingkat.arel_table[:tingkat],User.arel_table[:nama], User.arel_table[:id], User.arel_table[:fb], Spd.arel_table[:spd], Jabatan.arel_table[:jabatan]
  ]
).where(
  User.arel_table[:id].not_eq(params[:id]).and(
    User.arel_table[:spd_id].eq(params[:spd_id]).and(
      Hak.arel_table[:tingkat_id].eq(params[:tingkat_id]).and(User.arel_table[:city_id].eq(params[:city_id]))
    )
  )
).joins(
  Tingkat.arel_table.join(Hak.arel_table).on(Hak.arel_table[:hak].eq(Tingkat.arel_table[:id])).join_sources
).joins(
  Tingkat.arel_table.join(User.arel_table).on(
    Hak.arel_table[:hak].eq(User.arel_table[:tingkat_id])
  ).join_sources
).joins(
  Tingkat.arel_table.join(Spd.arel_table).on(User.arel_table[:spd_id].eq(Spd.arel_table[:id])).join_sources
).joins(
  Tingkat.arel_table.join(Jabatan.arel_table).on(
    User.arel_table[:jabatan_id].eq(Jabatan.arel_table[:id])
  ).join_sources
).order(Tingkat.arel_table[:id])

		render json: @tujuan
		
	end

	def user_out_room
         @tingkatx = 0
		if(params[:tingkat_id] <= "7") 
			
				@tingkatx = params[:tingkat_id]

				if params[:tingkat_id] == "7"

					@tingkatx = 6
					
				end

				#in here logic get users
				@tujuan = Tingkat.select(
  [
    Hak.arel_table[:tingkat_id], Tingkat.arel_table[:tingkat], User.arel_table[:nama], User.arel_table[:id], User.arel_table[:fb], Spd.arel_table[:spd], Jabatan.arel_table[:jabatan]
  ]
).where(
  User.arel_table[:id].not_eq(params[:id]).and(
    Hak.arel_table[:tingkat_id].eq(@tingkatx).and(User.arel_table[:city_id].eq(params[:city_id]))
  )
).joins(
  Tingkat.arel_table.join(Hak.arel_table).on(Hak.arel_table[:hak].eq(Tingkat.arel_table[:id])).join_sources
).joins(
  Tingkat.arel_table.join(User.arel_table).on(
    Hak.arel_table[:hak].eq(User.arel_table[:tingkat_id])
  ).join_sources
).joins(
  Tingkat.arel_table.join(Spd.arel_table).on(User.arel_table[:spd_id].eq(Spd.arel_table[:id])).join_sources
).joins(
  Tingkat.arel_table.join(Jabatan.arel_table).on(
    User.arel_table[:jabatan_id].eq(Jabatan.arel_table[:id])
  ).join_sources
).order(Tingkat.arel_table[:id])


	render json: @tujuan

		end
			
		
	end


	def profile
		@user = User.find(params[:id_user])
		render json: @user
		
	end





	private def params_users
		
    	params.permit(:spd_id,:jabatan_id,:eselon_id,:city_id, :tingkat_id,:fb,:token,:nama,:hp,:status)
 
	end



	private def set_content_type
 			
 		headers['Content-Type'] = 'multipart/form-data'
 		
 	end


	def spd_structural
		@users  = User.where(spd_id: params[:spd_id]).where(city_id: params[:city_id]).order(:tingkat_id)
		render json: @users
		
	end


end
