Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :reviews, except: %i[index show]
  end

  root to: 'landings#index'

  get '/about_us', to: 'static_pages#about_us', as: :about_us
  get '/contact_us', to: 'static_pages#contact_us', as: :contact_us
end
