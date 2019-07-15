Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to:'users#new'
  resources :users, except: [:new] #all the routes except the new one
  resources :articles  #gives us a new article path, a post to create and edit, delete, show, index,
                       # and update article

# Resource routing allows you to quickly declare all of the common routes for a given resourceful controller.
# Instead of declaring separate routes for your index , show , new , edit , create , update and destroy actions,
#a resourceful route declares them in a single line of code.

end
