RedditClone::Application.routes.draw do
  resources :users
  resource :session
  resources :subs do
    resources :links, :only => :create
  end
  resources :links, except: :create
  resources :comments
end
