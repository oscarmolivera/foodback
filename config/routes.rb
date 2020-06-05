Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'landings#index'

  get '/about_us', to: 'static_pages#about_us', as: :about_us
  get '/contact_us', to: 'static_pages#contact_us', as: :contact_us
end
