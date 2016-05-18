Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  get '/contact' => 'pages#contact'

  resources :articles, except: [:destroy] do
    resources :comments, only: [:create]
  end
end
