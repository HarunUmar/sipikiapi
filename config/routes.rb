Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  #resources :users, only:[:index, :create]
  namespace :kinerjas do
  	 get '/get_all_disposisi/:city_id', to: 'kinerjas#show_disposisi'
  	 get '/get_disposisi_user/:user_id', to: 'kinerjas#show_disposisi_user'
  	 get '/get_disposisi_spd/:spd_id', to: 'kinerjas#show_disposisi_spd'
  	 get '/get_my_disposisi/:user_id', to: 'kinerjas#show_my_disposisi'
  	 get '/spd_structural/:spd_id/:city_id', to: 'kinerjas#spd_structural'


  	 post '/', to: 'kinerjas#create_disposisi'
  	 post '/disposisi_balasan', to: 'kinerjas#create_disposisi_balasan'
  	 get '/terima_disposisi/:disposisi_id', to: 'kinerjas#terima_disposisi'
  	 get '/disposisi_selesai/:disposisi_id', to: 'kinerjas#disposisi_selesai'
  	 get '/tolak_disposisi/:disposisi_id', to: 'kinerjas#tolak_disposisi'
  	  
  	
  end
 

   namespace :datas do 
 		get '/get_provinsi', to: 'datas#get_provinsi'
 		get '/get_city/:provinsi_id', to: 'datas#get_city'
 		get '/get_instansi/:city_id', to: 'datas#get_instansi'
 		get '/get_spd/:instansi_id', to: 'datas#get_spd'
 		get '/get_jabatan/:instansi_id/:city_id', to: 'datas#get_jabatan'
 		get '/get_eselon', to: 'datas#get_eselon'
    end

     namespace :users do 
 		get '/cek_daftar/:id_fb/:version', to: 'users#cek_daftar'
 		get '/in_room/:id/:tingkat_id/:spd_id/:city_id', to: 'users#user_in_room'
 		get '/out_room/:id/:tingkat_id/:city_id', to: 'users#user_out_room'
 		post '/', to: 'users#create'
 		get '/in_spd/:spd_id', to: 'users#in_spd'
 		get '/', to: 'users#index'
    end


end
