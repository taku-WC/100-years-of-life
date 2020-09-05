Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/comfirm'
  get 'home/top'
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
