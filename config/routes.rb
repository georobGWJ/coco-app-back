Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # CHATROOM 
  resources :chats, only: [:index, :create]


  # USERS PROFILE ROUTES
  resources :users do 
    resources :requirements, except: [:destroy]
    # resources :sats
  end 


  # INFORMATIONAL ROUTES
  resources :applications, only: [:index, :create, :new]
  # resources :sats, only: [:index]
  resources :tips, only: [:create, :new]
  # resources :requirements, only: [:index]


  # FORUM ROUTES 
  resources :messages do
    resources :comments 
  end 


  # HOMEPAGE ROUTES 
  root 'welcome#index'
  get '/home' => 'welcome#index'


  # SIGN UP AND LOGIN ROUTES
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'


  # INFORMATIONAL ROUTES
  get '/requirements' => 'requirements#information'
  get '/sats' => 'sats#information'


end
