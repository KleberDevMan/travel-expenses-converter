Rails.application.routes.draw do

  resources :travels, only: :none do
    collection do
      get :estimate
      post :converter
    end
  end

end
