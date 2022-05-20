Rails.application.routes.draw do


  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  root to: 'public/homes#top'
  
  get 'customer/edit' => 'public/customers#edit'
  patch 'customer/e' => 'public/customers#update'


  scope module: :public do
    get 'about' => 'homes#about'
    resources :orders, only: [:new, :index, :show, :create]
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :items, only: [:show, :index]
    resources :deliveries, only: [:index, :destroy, :edit, :update, :create]
    resource :customers, only: [:show]

    patch 'customers/withdraw' => 'customers#withdraw'
    get 'customers/quit' => 'customers#quit'
  end



  namespace :admin do
    get '/' => 'homes#top'
    resources :orders, only: [:show, :update]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :items, only: [:index, :show, :new, :edit, :update, :create]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
  end

end
