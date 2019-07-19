class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy] #restrict the delete users action to admin

  def new
    @user = User.new  # new instance of the class User
  end

  def create
    @user = User.new(user_params)
    if @user.save  #if user is saved (acomplishes all conditions)
    session[:user_id]= @user.id   #sign in the user who just signed up
    flash[:success] = "Welcome to the Alpha Blog, #{@user.username}!"
    redirect_to user_path(@user) #redirect the new user to his own page

    else     #if no, we render the new template and display the errors
      render 'new'
    end
  end

  def edit


  end

  def update

    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show

    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5) #add pagination to user show
    #instance variable to paginate the articles of a single user
  end

  def index
  @users = User.paginate(page: params[:page], per_page: 5)
end


def destroy   #delete user method

@user = User.find(params[:id])

@user.destroy

flash[:danger] = "User and all articles created by user have been deleted"

redirect_to users_path

end


def set_user

  @user = User.find(params[:id])   #find user based on id
end


def require_same_user

if current_user != @user and !current_user.admin?  #if the user is not logged in and it is not the current user

flash[:danger] = "You can only edit your own account"

redirect_to root_path

end

end

def require_admin

if logged_in? and !current_user.admin?

flash[:danger] = "Only admin users can perform that action"

redirect_to root_path

end

end


private

def user_params

params.require(:user).permit(:username, :email, :password)

end
  end
