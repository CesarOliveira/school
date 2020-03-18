Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do

    resources :courses do
      get :all, on: :collection
      get '/by_name/:course_name', to: 'courses#by_name', on: :collection
    end

    resources :materials, only: [:index, :create, :update, :show, :destroy]
  end
end
