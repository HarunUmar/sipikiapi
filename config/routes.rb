Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  #resources :users, only:[:index, :create]
  namespace :kinerjas do
  	 get '/get_all_disposisi/:city_id', to: 'kinerjas#show_disposisi'
  	 get '/get_disposisi_user/:user_id', to: 'kinerjas#show_disposisi_user'
  	 get '/get_disposisi_spd/:spd_id', to: 'kinerjas#show_disposisi_spd'
  	 get '/get_my_disposisi/:user_id', to: 'kinerjas#show_my_disposisi'
  	 

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
 

   namespace :datas do 
 		get '/get_provinsi_city', to: 'datas#get_provinsi_city'
 		get '/get_instansi_spd/:city_id', to: 'datas#get_instansi_spd'
 		get '/get_pemkot/:spd_id', to: 'datas#get_pemkot'
    get '/lanjut/:id', to: 'datas#lanjut'
 		get '/get_eselon', to: 'datas#get_eselon'
    end

    namespace :users do 
 		get '/cek_daftar/:id_fb', to: 'users#cek_daftar'
    get 'update_token/:user_id/:token', to: 'users#update_token'

 		get '/tujuan/:city_id/:pemkot_id', to: 'users#tujuan'
    post '/', to: 'users#create'
 		get '/spd_structural/:spd_id/:city_id', to: 'users#spd_structural'
 		get '/', to: 'users#index'
 		get '/profile/:id_user', to: 'users#profile'
    end


end
