Rails.application.routes.draw do
  root to: 'subs#index'
  devise_for :users
  resources :subs
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show]
end
