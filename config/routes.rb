Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root to: redirect('admin/categories')

  get 'admin', to: redirect('admin/categories')
  namespace :admin do
    resources :categories
  end
end
