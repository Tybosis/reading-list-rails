Rails.application.routes.draw do
  root 'application#index'

  namespace :api, defaults: { formate: :json } do
    namespace :v1 do
      resources :books
    end
  end
end
