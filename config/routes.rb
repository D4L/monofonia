Monofonia::Application.routes.draw do
  match 'group/create' => 'group#create', :via => [:get, :post]
  get "user/logout"
  match 'user/signup' => 'user#signup', :via => [:get, :post]
  match 'user/login' => 'user#login', :via => [:get, :post]
  get "group/show"

  root :to => "home#index" # The main head
end
