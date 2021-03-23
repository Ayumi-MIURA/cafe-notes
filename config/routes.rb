Rails.application.routes.draw do
  mount ActionCable.server => "/cable" 
  devise_for :users
  root to: "notes#index"

  resources :notes do
    resources :comments, only: :create
    member do
      get 'search'
    end
  end
  resources :users, only: :show
end
