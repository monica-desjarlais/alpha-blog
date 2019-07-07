Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles  #gives us a new article path, a post to create and edit, delete, show, index,
                       # and update article 

end
