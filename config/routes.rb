Monofonia::Application.routes.draw do
  root :to => "home#index" # The main head

  match 'user/signup', :to => 'user#signup'
  match 'user/login', :to => 'user#login'
end
