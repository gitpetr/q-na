Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
   resources :questions do 
      resources :answers
   end
   root 'questions#index'
end
