# -*- encoding : utf-8 -*-
Mac2hand::Application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  } do
    get "logout" => "devise/sessions#destroy"
  end

  root :to => 'high_voltage/pages#show', :id => 'welcome'
  #root :to => "deals#index"
  
  resources :users do
    resources :sells
    resources :wants
  end

  resources :sells do
    resources :photos
    resources :comments
    member do
      get :publish
      get :cancel_publish
    end
    
  end

  resources :wants do
    resources :comments
    member do
      get :publish
      get :cancel_publish
    end
  end

  resources :lists do
    resources :sells
    resources :wants
  end

  resources :photos
  
  match "/account" => "users#edit", :as => :account
  match "/account/profile" => "users#profile"

end
