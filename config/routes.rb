require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users

  resources :transactions, only: %i(new create index)
  root to: redirect("/transactions")
end
