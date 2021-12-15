Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
    resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:new, :create, :index, :show, :edit, :update]
   get "/home/about" => "homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

