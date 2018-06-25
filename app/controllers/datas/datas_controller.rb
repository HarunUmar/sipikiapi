class Datas::DatasController < ApplicationController

	before_action :cegah


	require 'fcm'
    @@message = 'hallo'

    def send_notif	

        fcm = FCM.new('AAAArfsMQFU:APA91bFD3Ix90VUsMuf4fVRgOkBbwgyZ6SPH-MBsY3WK-cGR-Y7ByFKe3smyR7a9cLF1xdIZjQnokztkYDPhuPLqzLoqP7QIbM23ytg2eeN6T2LTpIzgk-iWmPOcBuS7mrIlQzC9XL5V') # Find server_key on: your firebase console on web > tab general > web api key
        response = fcm.send_to_topic("CANTIK",options)
        render json: {'success' => response}
    end


 def options
        {
          priority: 'high',
          data: {
            message: @@message
          },
          notification: {
            body: @@message,
            sound: 'default'
          }
        }
      end

      
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

		def cegah

 		 @header  = request.headers['Authorization']
 		 @header1  = request.headers['Content-MD5']
 		 @acak = Digest::MD5.hexdigest(@header)
 		 if(@acak != 'd2be162783a2a5eadf4a9a43eeea626a' and @header1 != 'azkha')
 		 	render status: 404
 		 end
 	end
 		

end
