Rails.application.routes.draw do
  
  root 'departments#index'

  get 'recentlyworked/:days', to: 'works#index'
  
  resources :departments 
  resources :projects 
  resources :works 
  
end
