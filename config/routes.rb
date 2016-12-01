Rails.application.routes.draw do
  resources :carts, only: [:create, :show], :defaults => { :format => :json } do
    resources :items
  end

  namespace :v1 do
    jsonapi_resources :carts
  end
end
