Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'
  
  #root 'departments#index'

  get 'recentlyworked/:days', to: 'works#index'
  
  resources :departments 
  resources :employees
  resources :projects 
  resources :works 
  
end
