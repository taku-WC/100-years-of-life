Rails.application.routes.draw do

  #googleAPI
    devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'home#top'
  get 'about', to: 'home#about'

  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
