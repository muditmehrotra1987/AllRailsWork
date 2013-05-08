Invitation::Application.routes.draw do
  
  get "home" => "authusers#index", :as => "home"
  
  get "index" => "home#index", :as => "index"  
  get "/signup_invit" => "invits#new", :as => "signup_invit"
  get "/log_in" => "sessions#new", :as => "log_in"
  get "/log_out" => "sessions#destroy", :as => "log_out"    
  get "/register" => "users#create", :as => "register"  
  match "/signup/:invit_token" => "users#new", :as => "signup"  #************** use for sending signup token with URL
  get "users/home"
  
  resources :invits
  resources :users
  resources :sessions
  root :to => "home#index"
  
end