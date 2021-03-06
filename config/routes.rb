Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get 'faq' => 'home#faq', as: 'faq'
  get 'product-detail/:permalink' => "home#product_detail", as: "product_detail"
  get 'show-modal-product-detail/:permalink' => "home#show_modal", as: "show_modal_product_detail"
  post "contact_us" => "home#contact_us", as: "save_contact_us"

  get    '/login' => 'session#new', as: "login"
  post   '/login' => 'session#create', as: "login_create"
  delete '/logout' => 'session#destroy', as: "logout"

  get "admin" => "admin/dashboard#index", as: "admin"
  namespace :admin do
    resources :banners
    resources :services
    resources :products
  end
  root to: "home#index"
  
end
