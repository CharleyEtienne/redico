Rails.application.routes.draw do
  resources :notes
  resources :messages
  resources :salves
  resources :topics
  devise_for :users
  root 'home#index'

  get 'home/private'
  match "/participate" => "participation#participate", :via => :post, :as => :participate
  match "/salve" => "salves#finish", :via => :post, :as => :finish
  match "/take_salve" => "salves#take_salve", :via => :post, :as => :take_salve
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
