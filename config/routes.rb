Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources :pins do
  	member do
  		put "like", to: "pins#upvote"
  	end
  resources :comments
  end
  root "pins#index"

  get ':id' => 'users#show', as: :user_profile
  get ':id/setting' => 'users#edit', as: :user_setting
  match ':id/setting' => 'users#update', via: [:put, :patch]

end