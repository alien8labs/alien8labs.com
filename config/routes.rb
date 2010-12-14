Alien8labsCom::Application.routes.draw do
  root :to => "articles#index"

  resources :articles, :only => [:index, :show]
  
  # Note: No user registration, only login/logout for Ryan/Eric
  post '/login' => 'devise/sessions#create', :as => :user_session
  get  '/login' => 'devise/sessions#new',    :as => :new_user_session
end
