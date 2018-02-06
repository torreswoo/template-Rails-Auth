Rails.application.routes.draw do

  root to: "projects#index"

  devise_for :users, skip: [ :sessions ]
  devise_scope :user do
    get 'login' => 'sessions#new', :as => :new_user_session
    post 'login' => 'sessions#create', :as => :user_session
    get 'logout' => 'sessions#destroy', :as => :destory_user_session
  end

  resources :projects do |project|
    get :permission_policy

    resources :posts do |post|
      member do

      end
    end

  end

  resources :audits

end
