Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :restaurants
      resources :categories
      resources :reviews

      root to: "users#index"
    end
    
  devise_for :users

  resources :categories

  resources :restaurants do
    resources :reviews, except: %i[index show]
    collection do
      get 'search'
    end
  end

  root to: 'landings#index'

  get '/about_us', to: 'static_pages#about_us', as: :about_us
  get '/contact_us', to: 'static_pages#contact_us', as: :contact_us
end
