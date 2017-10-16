Rails.application.routes.draw do

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'



  root 'index#index'
  #get '*path', to: 'index#index'

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
   #
  #  get 'admin/index'
   #
  #  get 'admin/show'
   #
  #  get 'admin/create'
   #
  #  get 'admin/update'
   #
  #  get 'admin/destroy'
   #
  #  get 'tour/index'
   #
  #  get 'tour/show'
   #
  #  get 'tour/create'
   #
  #  get 'tour/update'
   #
  #  get 'tour/destroy'
   #
  #  get 'stops/index'
   #
  #  get 'stops/import'

#   For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
