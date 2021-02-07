Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'home#show'
  get '/show', to: 'home#show'

  defaults format: :json do
    namespace :api do
      namespace :v1 do
        post '/gps', to: 'location#create'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
