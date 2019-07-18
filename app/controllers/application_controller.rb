class ApplicationController < ActionController::Base


protect_from_forgery with: :exception

helper_method :current_user, :logged_in? #this makes the methods below available to our views

def current_user

#return this @current user, only if he exists, if not, find him based on the current id stored in session
@current_user ||= User.find(session[:user_id]) if session[:user_id] #return this user if there is a user id stored in our session hash

end


def logged_in? #boolean, return true if there is a current user

!!current_user

end


def require_user  #restrict certain actions based on if there is a logged in user or not

if !logged_in?  # if user is not logged in, we redirect him to hoempage

flash[:danger] = "You must be logged in to perform that action"

redirect_to root_path

end

end

end
