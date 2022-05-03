Rails.application.routes.draw do
  defaults format: :json do
    resources :items, only: [:index, :show, :update]
    resources :orders, :only => [:show, :create]
    # Defines the root path route ("/")
    root "items#index"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
