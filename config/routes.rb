Rails.application.routes.draw do
  resources :stops do
    collection do
      post :import
    end
  end
  root to: "stops#index"
end
