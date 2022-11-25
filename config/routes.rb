Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 resources :users
  root "home#welcome"
  resources :todos do 
    resources :todo_items , only: [:create]
  end
 
  resources :todo_items do 
    member do
      post '/complete',to: 'todo_items#mark_complete'
      post '/incomplete',to: 'todo_items#mark_incompleted'
    end
  end
end
