Rails.application.routes.draw do

  resources :admin do
    resources :tour do
      resources :stop do
        collection do
          post :import
        end
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
