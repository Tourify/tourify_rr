Rails.application.routes.draw do

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/', to: 'index#index'

  get '/stops/download_template'

  resources :sessions
  resources :organizations do
    get 'register', to: 'admins#new', as: 'register'
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
