Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :news, only: [:show, :index, :new, :create, :edit, :update]
end
