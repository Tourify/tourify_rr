Rails.application.routes.draw do

  get '/stops/download_template'

  root to: "sessions#new"

  resources :sessions
  resources :organizations, except: [:create, :destroy] do
    resources :admins
    resources :tours do
      resources :stops do
        collection do
          post :import
          delete :destroy_stops
        end
      end
    end
  end
end
