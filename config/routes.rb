Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  mount ActionCable.server => "/cable" 
  devise_for :users
  root to: "notes#index"

  resources :notes do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
