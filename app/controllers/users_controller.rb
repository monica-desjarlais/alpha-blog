class UsersController < ApplicationController
  def new
    @user = User.new  # new instance of the class User
  end

  def create
    @user = User.new(user_params)
    if @user.save  #if user is saved (acomplishes all conditions)
    flash[:success] = "Welcome to the Alpha Blog, #{@user.username}!"
    redirect_to articles_path
    else     #if no, we render the new template and display the errors
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id]) # find user based on id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id]) #grab user from id
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5) #add pagination to user show
    #instance variable to paginate the articles of a single user
  end

  def index
  @users = User.paginate(page: params[:page], per_page: 5)
end


private

def user_params

params.require(:user).permit(:username, :email, :password)

end
  end
