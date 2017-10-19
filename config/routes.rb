Rails.application.routes.draw do

  get '/stops/download_template'
  
  root to: "photos#index"
  resources :photos

  resources :sessions
  resources :organizations, except: [:create, :destroy] do
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
