Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  #resources :users, only:[:index, :create]
  get '/kinerja/disposisi', to: 'kinerjas#show_disposisi'
  post '/kinerja/disposisi', to: 'kinerjas#create_disposisi'

   namespace :datas do 
 		get '/get_provinsi', to: 'datas#get_provinsi'
 		get '/get_city/:provinsi_id', to: 'datas#get_city'
 		get '/get_instansi/:city_id', to: 'datas#get_instansi'
 		get '/get_spd/:instansi_id', to: 'datas#get_spd'
 		get '/get_jabatan/:instansi_id/:city_id', to: 'datas#get_jabatan'
 		get '/get_eselon', to: 'datas#get_eselon'
    end

     namespace :users do 
 		get '/cek_daftar/:id_fb', to: 'users#cek_daftar'
 		post '/', to: 'users#create'
 		get '/in_spd/:spd_id', to: 'users#in_spd'
    end


end
