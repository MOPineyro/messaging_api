Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users
    end
  end

  scope module: :api, defaults: {format: :json} do
    scope module: :v1, path: '/api/v1' do
      get '/hello', to: 'authorized#hello'
      get '/users', to: 'users#index'
      post '/messages', to: 'messages#create'
      get '/conversations', to: 'conversations#index'
      post '/conversations', to: 'conversations#create'
      get '/conversations/:conversation_id/messages', to: 'messages#index'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
