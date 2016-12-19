Rails.application.routes.draw do

  get '/users/current-user', to: "current_user#show"
  resources :users
  # post '/login', to: "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # CHATROOM
  resources :chats, only: [:index, :create]


  # INFORMATIONAL PAGES:
  resources :sats, only: [:index]
  get '/requirements' => 'requirements#information'


  # USERS PROFILE ROUTES
  resources :users do
    resources :requirements, except: [:destroy]
    resources :events
  end

  # TIPS FOR ADMIN USE
  resources :tips


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

  mount Knock::Engine => "/knock"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
