Rails.application.routes.draw do

  root to: 'admins#new', organization_id: 3
  
  get '/stops/download_template'

  delete '/logout',  to: 'sessions#destroy'

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
