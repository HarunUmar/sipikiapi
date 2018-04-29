Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





  #resources :users, only:[:index, :create]
  namespace :kinerjas do
  	 get '/get_all_disposisi/:city_id', to: 'kinerjas#show_disposisi'
  	 get '/get_disposisi_user/:user_id', to: 'kinerjas#show_disposisi_user'
  	 get '/get_disposisi_spd/:spd_id', to: 'kinerjas#show_disposisi_spd'
  	 get '/get_my_disposisi/:user_id', to: 'kinerjas#show_my_disposisi'
  	 
     #fix

  	 post '/', to: 'kinerjas#create_disposisi'
  	 post '/disposisi_balasan', to: 'kinerjas#create_disposisi_balasan'

  	 get '/terima_disposisi/:user_id/:disposisi_id', to: 'kinerjas#terima_disposisi'
  	 get '/disposisi_selesai/:user_id/:disposisi_id', to: 'kinerjas#disposisi_selesai'
  	 get '/tolak_disposisi/:user_id/:disposisi_id', to: 'kinerjas#tolak_disposisi'
     get '/beri_nilai_disposisi/:user_id/:disposisi_id/:nilai', to: 'kinerjas#beri_nilai_disposisi'
     
  	 
     get '/details_disposisi/:disposisi_id', to: 'kinerjas#details_disposisi'
     get '/details_my_disposisi/:user_id/:disposisi_id', to: 'kinerjas#details_my_disposisi'
  	 get '/details_user_disposisi/:user_id/:disposisi_id', to: 'kinerjas#details_user_disposisi'
     
  	
  end
  namespace :agendas do
     get '/get_all_agenda/:city_id', to: 'agendas#show_agenda'
     get '/get_agenda_user/:user_id', to: 'agendas#show_agenda_user'
     #get '/get_agenda_spd/:spd_id', to: 'agendas#show_agenda_spd'
     get '/get_my_agenda/:user_id', to: 'agendas#show_my_agenda'
     

     post '/', to: 'agendas#create_agenda'
     post '/absen', to: 'agendas#absen'


     get '/details_agenda/:agenda_id', to: 'agendas#details_agenda'
     get '/details_my_agenda/:user_id/:agenda_id', to: 'agendas#details_my_agenda'
     get '/details_user_agenda/:user_id/:agenda_id', to: 'agendas#details_user_agenda'
     
    
  end
 

   namespace :datas do 
 		get '/get_provinsi_city', to: 'datas#get_provinsi_city'
 		get '/get_instansi_spd/:city_id', to: 'datas#get_instansi_spd'
 		get '/get_pemkot/:spd_id', to: 'datas#get_pemkot'
    get '/lanjut/:id', to: 'datas#lanjut'
 		get '/get_eselon', to: 'datas#get_eselon'
    get '/send_notif', to: 'datas#send_notif'
    end

    namespace :users do 
 		get '/cek_daftar/:id_fb', to: 'users#cek_daftar'
    get 'update_token/:user_id/:token', to: 'users#update_token'

 		get '/tujuan/:city_id/:pemkot_id', to: 'users#tujuan'
    post '/', to: 'users#create'
 		get '/spd_structural/:spd_id/:parent_unit/:city_id', to: 'users#spd_structural'
 		get '/', to: 'users#index'
 		get '/profile/:user_id', to: 'users#profile'
    get '/notif/:user_id', to: 'users#notif'
    end


end
