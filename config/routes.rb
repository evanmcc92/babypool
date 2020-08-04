Rails.application.routes.draw do
  resources :babies do
    member do
      get 'born'
      post 'born', to: 'babies#born_post'
    end
      resources :pools
  end
  devise_for :admins
  get 'index/index'
 
  root 'index#index'
end
