Rails.application.routes.draw do
  devise_for :users
  concern :commentable do 
    resources :comments
  end
   resources :questions, concerns: :commentable, shallow: true do 
      resources :answers, concerns: :commentable 
   end
   root 'questions#index'
end
