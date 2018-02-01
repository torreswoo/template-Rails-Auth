Rails.application.routes.draw do

  root to: "projects#index"

  resources :projects
  # devise_for :users

  devise_for :users, skip: [ :sessions ]
  devise_scope :user do
    get 'login' => 'sessions#new', :as => :new_user_session
    post 'login' => 'sessions#create', :as => :user_session
    get 'logout' => 'sessions#destroy', :as => :destory_user_session
  end
end
