Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/auth/google_oauth2/callback'=> 'sessions#omniauth'

  resources :users, only: [:show, :new, :create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
end
