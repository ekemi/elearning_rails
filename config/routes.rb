Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'sessions#home'
get '/signup' => 'students#new'
post '/signup'=> 'students#create'
resources :students
end
