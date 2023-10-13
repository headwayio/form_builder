Rails.application.routes.draw do
  resources :forms do
    resources :versions, only: [:create, :destroy]
  end

  resources :questions, only: [:update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
