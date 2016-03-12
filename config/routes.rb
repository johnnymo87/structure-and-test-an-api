Rails.application.routes.draw do
  resources :organisations, only: [] do
    resources :volunteer_opportunities, only: [:index]
  end
end
