Rails.application.routes.draw do
  get '/', to: 'index#index'

  get '/stops', to: 'stops#index'
  post '/stops', to: 'stops#import'
  root to: "stops#index"

  resources :organizations do
    resources :admin
  end

  resources :tours do
    resources :stops do
      collection do
        post :import
      end
    end
  end

  # get 'admin/index'
  #
  # get 'admin/show'
  #
  # get 'admin/create'
  #
  # get 'admin/update'
  #
  # get 'admin/destroy'
  #
  # get 'tour/index'
  #
  # get 'tour/show'
  #
  # get 'tour/create'
  #
  # get 'tour/update'
  #
  # get 'tour/destroy'
  #
  # get 'stops/index'
  #
  # get 'stops/import'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
