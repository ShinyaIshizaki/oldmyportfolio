Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts
  resources :users
  
  root 'home#top'
  get 'user/new'
  get 'users/:id' => 'users#show'
  get "users/:id/edit" => "users#edit"
  post 'users/create' => 'users#create'
  get 'top' => "home#top"
  post "about" => "home#about"
  get 'signup'  => 'users#new'
  post 'signup'  => 'users#new'
  delete 'logout' => "users#destroy"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
