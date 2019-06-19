Rails.application.routes.draw do
 
  root 'employees#index'
  resources :categories
  resources :suppliers
  resources :products

  resources :employees do
    collection do
     get :export_data
     post :data_check
     post :delete_number
    end
  end
  resources :departments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
