Rails.application.routes.draw do
  resources :pools
  resources :babies
  get 'baby/born' => 'babies#baby_born'
  devise_for :admins
  get 'index/index'
 
  root 'index#index'
end
