Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  devise_for :users,
    controllers: { registrations: 'registrations' }

  resources :users, only: %i(show)

  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)

    resources :likes, only: %i(create destroy), shallow: true

    resources :comments, only: %i(index create destroy), shallow: true
  end
end
