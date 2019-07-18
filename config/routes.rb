Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'  #pages =controller, about =action
  get 'signup', to:'users#new'
  resources :users, except: [:new] #all the routes except the new one
  resources :articles  #gives us a new article path, a post to create and edit, delete, show, index,
                       # and update article
  get 'login', to: 'sessions#new' #sessions=controller, new=action
  post 'login', to: 'sessions#create' #will post the form and create user's session (logged in state)
  delete 'logout', to: 'sessions#destroy' #user logout, destroy session

# Resource routing allows you to quickly declare all of the common routes for a given resourceful controller.
# Instead of declaring separate routes for your index , show , new , edit , create , update and destroy actions,
#a resourceful route declares them in a single line of code.

end
