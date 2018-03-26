class Datas::DatasController < ApplicationController

	def get_provinsi
		@provinsi = Provinsi.all
		render json: @provinsi
	end
	def get_city
		@city = City.where(provinsi_id: params[:provinsi_id])
		render json: @city
	end
	def get_instansi
		@instansi = Instansi.where(city_id: params[:city_id])
		render json: @instansi
	end
	
	def get_spd
		@spd = Spd.where(instansi_id: params[:instansi_id])
		render json: @spd
	end

	def get_jabatan 
		@Jabatan = Jabatan.where(instansi_id: params[:instansi_id]).where(city_id: params[:city_id])
		render json: @Jabatan
	end

	def get_eselon
		@eselon = Eselon.all
		render json: @eselon
	end

end
