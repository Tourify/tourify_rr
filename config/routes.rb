Rails.application.routes.draw do
  get '/', to: 'index#index'

  get '/stops', to: 'stops#index'
  post '/stops', to: 'stops#import'
  root to: "stops#index"

  resources :organizations do
    resources :admins
    resources :tours do
      resources :stops do
        collection do
          post :import
        end
      end
    end
  end
end
