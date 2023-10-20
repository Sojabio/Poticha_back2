Rails.application.routes.draw do
  resources :contacts
  resources :posts
  resources :countdowns
  resources :books
  resources :authors do
    member do
      get 'showadmin'
    end
  end

  resources :user, only: :show
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '*path', to: 'application#index', format: false

end
