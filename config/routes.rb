Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }
  root 'static_pages#index'

  resources :dishes,      :only => [:create, :show, :index, :destroy]
  resources :restaurants, :only => [:create, :show, :index]
  resources :comments,    :only => [:create, :show, :index, :destroy, :update]
end

