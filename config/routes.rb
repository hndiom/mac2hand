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
    resources :deals
  end

  resources :deals do
    resources :photos
    member do
      get :publish
      get :cancel_publish
    end
    
  end

  resources :photos
  
  match "/account" => "users#edit", :as => :account

end
