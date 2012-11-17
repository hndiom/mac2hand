Mac2hand::Application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  } do
    get "logout" => "devise/sessions#destroy"
  end

  #root :to => 'high_voltage/pages#show', :id => 'welcome'

  resources :users do
    resources :deals
  end

  resources :boards do
    resources :deals
  end

  root :to => "boards#index"
end
