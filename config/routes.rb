Rails.application.routes.draw do
  root to: 'pages#home'
  get '/contact' => 'pages#contact'

  resources :articles
end
