Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    #resources :products
    #makes route productAdmin
    #get 'products/Admin', to: 'products#admin', as: :product_admin

    resources :products do
      collection do
        get 'admin'
      end
    end
    

    root "products#index"    
end


