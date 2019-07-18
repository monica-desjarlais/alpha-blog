class SessionsController < ApplicationController

def new  # action which will render the login form
  render 'new'
end

def create  #will handle the form submission, start the session and display users in a logged in state
  user = User.find_by(email: params[:session][:email].downcase) # for an exact comparison the email must be in down case
  if user && user.authenticate(params[:session][:password])  # if the user is found and password matches
    session[:user_id] = user.id  #save this user id in your browser => cookies will handle this; info will be used for requests
    flash[:success] = "You have successfully logged in"
    redirect_to user_path(user)  #redirect user to his own page
 else
  flash.now[:danger] = "Your login information is not correct"
  render 'new'
 end
end

def destroy  #for logging out, destroy user session
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
end

end
