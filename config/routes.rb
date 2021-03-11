Rails.application.routes.draw do
  devise_for :users,
  controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

  namespace :admin do
    resources :words
    resources :categories
  end
  resources :words
end
