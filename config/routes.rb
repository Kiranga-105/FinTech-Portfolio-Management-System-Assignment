Rails.application.routes.draw do
  root "contacts#index"
  resources :contacts, only: [:index, :show] do
    member do
      post :send_email_simulation
      get :preview_email
    end
  end

  resources :email_templates do
    member do
      get :preview
    end
  end

  resources :send_logs, only: [:index, :show]
end
