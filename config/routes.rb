Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :rooms, only: [:index, :show] do
    resources :chats, only: :create
  end

  root 'rooms#index'
end
