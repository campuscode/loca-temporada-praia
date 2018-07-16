Rails.application.routes.draw do

  devise_for :realtors
  devise_for :users
  resources :proposals , only: [:index]
  root to: 'properties#index'
  get 'by_region', to: 'properties#search', as: 'search'
  get 'by_realtor', to: 'properties#realtor'
  resources :properties, only: [:show, :new, :create, :edit, :update] do
    resources :proposals, only: [:new, :create]
  end
  get 'property_type/index', to: 'property_types#index'
  get 'region/index', to: 'regions#index'
  get 'property/all_properties', to: 'properties#all_properties'

  resources :property_types, only: [:show, :new, :create, :edit, :update, :index]
  resources :regions, only: [:show, :new, :create, :edit, :update]
  resources :proposals, only: [:show] do
    post '/approve', to: 'proposals#approve'
  end
end
