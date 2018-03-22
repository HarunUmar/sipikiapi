Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, only:[:index, :create]
  #resources :users, only:[:index, :create]
  get '/kinerja/disposisi', to: 'kinerjas#show_disposisi'
  post '/kinerja/disposisi', to: 'kinerjas#create_disposisi'
  


end
