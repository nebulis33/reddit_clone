Rails.application.routes.draw do
  root to: 'subs#index'
  devise_for :users
  resources :subs
  resources :posts, except: [:index] do
    member do
      post "upvote"
      post "downvote"
    end
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show] do
    member do
      post "upvote"
      post "downvote"
    end
  end
end
