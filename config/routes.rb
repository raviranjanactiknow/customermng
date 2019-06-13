Rails.application.routes.draw do
  root 'employees#index'
  
  resources :employees do
    collection do
     get :export_data
     post :data_check
     post :delete_number
    end
  end
  resources :departments
  # get 'employees/new'
  # get 'employees/create'
  # get 'employees/update'
  # get 'employees/edit'
  # get 'employees/destroy'
  # get 'employees/index'
  # get 'employees/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
