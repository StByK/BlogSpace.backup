Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/filter' => 'posts#filter'
  resources :posts, only: [:index, :new, :create, :edit, :destroy, :show, :update]
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
