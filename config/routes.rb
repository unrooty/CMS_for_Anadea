Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages
  get 'published_pages', to: 'pages#published_pages', as: :published_pages
  get 'unpublished_pages', to: 'pages#unpublished_pages', as: :unpublished_pages
  root 'pages#index'

  match '*path', to: 'application#routing_error', via: %i[get post put delete]
end
