Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chats, only: [:index, :create]

  resources :users do 
    resources :requirements do 
      resources :events, only: [:create, :new]
    end 
  end 

  resources :messages do
    resources :comments 
  end 

  resources :events

  resources :tips, only: [:create, :new] do 
    resources :events, only: [:create, :new]
  end 

  resources :applications, only: [:index, :show] do 
    resources :events, only: [:create, :new]
  end 

  # HOMEPAGE ROUTES 
  root 'welcome#index'
  get '/home' => 'welcome#index'

  # SIGN UP AND LOGIN ROUTES
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

end
