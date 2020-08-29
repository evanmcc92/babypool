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
  get 'index/score', as: 'score'
  get 'index/privacy_policy', as: 'privacy_policy'
 
  root 'index#index'
end
