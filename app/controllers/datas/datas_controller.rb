class Datas::DatasController < ApplicationController

	def get_provinsi_city
		@provinsi = Provinsi.all
		render json: @provinsi
	end	

	def get_instansi_spd
		@instansi = Instansi.where(city_id: params[:city_id])
		render json: @instansi
	end
	
	def get_pemkot
		@pemkot = Pemkot.where(spd_id: params[:spd_id]).where(kop: 1)
		render json: @pemkot
	end

	def lanjut
		@pemkot = Pemkot.where(parent_daftar: params[:id])
		render json: @pemkot
	end

	
	def get_eselon
		@eselon = Eselon.all
		render json: @eselon
	end

	def serializer_method
		defined?(@provinsi) ? ProvinsiSerializer : CitySerializer 
		
	end

end
