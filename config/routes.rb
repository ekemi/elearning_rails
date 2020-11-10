Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #any wrong url
 
  #Home page route
  root 'sessions#home'
  #Sign Up page
  get '/signup' => 'students#new'
  post '/signup'=> 'students#create'
  #Log In page route
  get '/login' => 'sessions#new' # display the log in page
  post '/login'=>'sessions#create' #process the log in page

  #Log Out page
  delete '/logout' => 'sessions#destroy'# user can not view in the url bar
  resources :students
  resources :courses
end
