Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"
  resources :lists, only: [:create, :new, :show] do
    resources :bookmarks, only: [:index,:create,:new]
  end
end
