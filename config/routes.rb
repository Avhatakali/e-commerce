Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
    resources:products do
      resources:comments
      collection do
        post '/:id/purchase', to: 'products#purchase', as: 'purchase'
      end

      collection do
        get '/:id/increase', to: 'products#increase', as: 'increase'
      end
    end
  end
