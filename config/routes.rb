Rails.application.routes.draw do
  root to: 'subs#index'
  devise_for :users
  resources :subs
  resources :posts, except: [:index]
end
