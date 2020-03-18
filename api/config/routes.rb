Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :courses, only: [:index, :create, :update, :show, :destroy]
    resources :materials, only: [:index, :create, :update, :show, :destroy]
  end
end
